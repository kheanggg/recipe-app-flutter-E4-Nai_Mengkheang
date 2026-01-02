import 'package:recipe_finder_flutter/shared/domain/model/category.dart';
import 'package:recipe_finder_flutter/shared/data/remote/category_service.dart';
import 'package:recipe_finder_flutter/shared/domain/model/meal.dart';
import 'package:recipe_finder_flutter/shared/data/remote/meal_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'explore_notifier.g.dart';

class ExploreState {
  final String? selectedCategory;
  final String? selectedCuisine;

  ExploreState({this.selectedCategory, this.selectedCuisine});

  ExploreState copyWith({
    String? category, 
    String? cuisine,
    bool clearCategory = false,
    bool clearCuisine = false,
  }) {
    return ExploreState(
      selectedCategory: clearCategory ? null : (category ?? selectedCategory),
      selectedCuisine: clearCuisine ? null : (cuisine ?? selectedCuisine),
    );
  }
}

@riverpod
class ExploreScreenNotifier extends _$ExploreScreenNotifier {
  @override
  ExploreState build() => ExploreState();

  void toggleCategory(String category) {
    if (state.selectedCategory == category) {
      state = state.copyWith(clearCategory: true);
    } else {
      state = state.copyWith(category: category);
    }
  }

  void toggleCuisine(String cuisine) {
    if (state.selectedCuisine == cuisine) {
      state = state.copyWith(clearCuisine: true);
    } else {
      state = state.copyWith(cuisine: cuisine);
    }
  }
}

@riverpod
Future<List<Category>> exploreCategories(Ref ref) async {
  final service = ref.watch(categoryServiceProvider);
  final categories = await service.getCategories();
  categories.sort((a, b) => a.name.compareTo(b.name));
  return categories;
}

@riverpod
Future<List<Meal>> exploreMeals(Ref ref) async {
  final service = ref.watch(mealServiceProvider);
  final state = ref.watch(exploreScreenProvider);
  
  final category = state.selectedCategory;
  final cuisine = state.selectedCuisine;

  if (category == null && cuisine == null) {
    return [];
  }

  List<Meal> meals;
  if (category != null) {
    meals = await service.getMealsByCategory(category);
  } else {
    meals = await service.getMeals(); 
  }

  if (cuisine != null) {
    return meals.where((m) => m.area == cuisine).toList();
  }

  return meals;
}

@riverpod
Future<List<String>> exploreCuisines(Ref ref) async {
  final service = ref.watch(mealServiceProvider);

  final meals = await service.getMeals(category: null);
  
  final cuisines = meals
      .map((m) => m.area)
      .whereType<String>()
      .toSet()
      .toList();
      
  cuisines.sort();
  return cuisines;
}