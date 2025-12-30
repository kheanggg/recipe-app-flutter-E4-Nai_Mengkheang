import 'package:recipe_finder_flutter/shared/data/remote/meal_service.dart';
import 'package:recipe_finder_flutter/shared/domain/model/meal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meal_repository.g.dart';

@Riverpod(keepAlive: true)
MealRepository mealRepository(Ref ref) {
  final service = ref.watch(mealServiceProvider);
  return MealRepository(mealService: service);
}

class MealRepository {
  final MealService _mealService;

  MealRepository({required MealService mealService})
      : _mealService = mealService;

  Future<List<Meal>> getMeals({
    String? category,
    String? area,
    bool? isFavorite,
  }) async {
    return _mealService.getMeals(
      category: category,
      area: area,
      isFavorite: isFavorite,
    );
  }

  Future<Meal?> getMealById(int id) async {
    return _mealService.getMealById(id);
  }

  Future<List<Meal>> getMealsByCategory(String category) =>
      _mealService.getMealsByCategory(category);
}
