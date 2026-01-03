import 'package:recipe_finder_flutter/core/utils/network/api_client.dart';
import 'package:recipe_finder_flutter/shared/domain/model/meal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meal_service.g.dart';

@Riverpod(keepAlive: true)
MealService mealService(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return MealService(apiClient: apiClient);
}

class MealService {
  final ApiClient _apiClient;

  MealService({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  Future<List<Meal>> getMeals({
    String? category,
    String? area,
    bool? isFavorite,
  }) async {
    final qParams = {
      if (category != null) 'category': category,
    };

    final response = await _apiClient.get<List<dynamic>>(
      'meals',
      params: qParams,
    );

    return response
        .map((json) => Meal.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<Meal?> getMealById(int id) async {
    try {
      final response = await _apiClient.get<dynamic>('meals/$id');

      if (response == null) return null;

      if (response is List && response.isNotEmpty) {
        final first = response.first;
        if (first is Map<String, dynamic>) {
          return Meal.fromJson(first);
        }
      }

      if (response is Map<String, dynamic>) {
        return Meal.fromJson(response);
      }

      return null;
    } catch (e) {
      print('Error in getMealById($id): $e');
      return null;
    }
  }


  /// Fetch meals by category
  Future<List<Meal>> getMealsByCategory(String category) =>
      getMeals(category: category);
}
