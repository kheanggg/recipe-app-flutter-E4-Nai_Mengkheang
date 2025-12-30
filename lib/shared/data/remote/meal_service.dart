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

  /// Fetch meals with optional query parameters
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

  /// Fetch a single meal by ID
  Future<Meal?> getMealById(int id) async {
    final response = await _apiClient.get<List<dynamic>>(
      'meals',
      params: {'id': id},
    );

    return Meal.fromJson(response.first as Map<String, dynamic>);
  }

  /// Fetch meals by category
  Future<List<Meal>> getMealsByCategory(String category) =>
      getMeals(category: category);
}
