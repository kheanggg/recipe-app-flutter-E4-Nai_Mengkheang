import 'package:recipe_finder_flutter/core/utils/network/api_client.dart';
import 'package:recipe_finder_flutter/shared/domain/model/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_service.g.dart';

/// Provides a singleton of CategoryService
@Riverpod(keepAlive: true)
CategoryService categoryService(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return CategoryService(apiClient: apiClient);
}

/// Handles API calls related to categories
class CategoryService {
  final ApiClient _apiClient;

  CategoryService({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<List<Category>> getCategories() async {
    final response = await _apiClient.get('categories');

    return (response as List<dynamic>)
        .map((json) => Category.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
