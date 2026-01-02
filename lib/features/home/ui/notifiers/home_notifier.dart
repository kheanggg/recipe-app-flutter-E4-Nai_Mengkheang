import 'package:recipe_finder_flutter/shared/domain/model/category.dart';
import 'package:recipe_finder_flutter/shared/data/remote/category_service.dart';
import 'package:recipe_finder_flutter/shared/domain/model/meal.dart';
import 'package:recipe_finder_flutter/shared/data/remote/meal_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_notifier.g.dart';

// -----------------------------------------------------------------------------
// 1. Selected Category State (Synchronous)
// -----------------------------------------------------------------------------
@riverpod
class SelectedCategoryNotifier extends _$SelectedCategoryNotifier {
  @override
  int? build() {
    return null;
  }

  void select(int? categoryId) {
    state = categoryId;
  }
}

// -----------------------------------------------------------------------------
// 2. Categories Data Provider
// -----------------------------------------------------------------------------
@riverpod
Future<List<Category>> homeCategories(Ref ref) async {
  final service = ref.watch(categoryServiceProvider); // use the service
  return service.getCategories();
}

// -----------------------------------------------------------------------------
// 3. Meals Data Provider
// -----------------------------------------------------------------------------
@riverpod
Future<List<Meal>> homeMeals(Ref ref, {String? category}) async {
  final service = ref.watch(mealServiceProvider);

  if (category != null && category.isNotEmpty) {
    return service.getMealsByCategory(category);
  } else {
    return service.getMeals();
  }
}

// -----------------------------------------------------------------------------
// 4. Cuisines Data Provider
// -----------------------------------------------------------------------------
@riverpod
Future<List<String>> homeCuisines(Ref ref) async {
  final meals = await ref.watch(homeMealsProvider(category: null).future);

  final cuisines = meals
      .map((meal) => meal.area)
      .whereType<String>()         
      .toSet()                 
      .toList();

  cuisines.sort(); 
  return cuisines;
}