import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'api_client.g.dart'; // generated file

// Riverpod provider for ApiClient singleton
@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) {
  return ApiClient();
}

class ApiClient {
  final http.Client _client;

  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  // Default headers for all requests
  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-DB-NAME': dotenv.env['DB_NAME'] ?? '',
      };

  /// GET request with optional query parameters
  Future<T> get<T>(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      final uri = Uri.parse('${dotenv.env['BASE_URL']}$endpoint').replace(
        queryParameters: params,
      );

      print('API GET: $uri');

      final response = await _client.get(uri, headers: _headers);

      return _handleResponse<T>(response);
    } catch (e) {
      print('API GET Error: $e');
      rethrow;
    }
  }

  /// Handle response and decode JSON
  T _handleResponse<T>(http.Response response) {
    print('API Response Status: ${response.statusCode}');

    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) return null as T;
      return json.decode(response.body) as T;
    } else {
      throw ApiException(
        statusCode: response.statusCode,
        message: 'API Error: ${response.statusCode} - ${response.body}',
      );
    }
  }

  /// Close the HTTP client
  void dispose() {
    _client.close();
  }
}

/// Custom exception for API errors
class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException({required this.statusCode, required this.message});

  @override
  String toString() => message;
}