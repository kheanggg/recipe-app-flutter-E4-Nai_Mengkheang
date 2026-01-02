import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_finder_flutter/features/explore/ui/widgets/meal_items_widget.dart';
import 'notifiers/explore_notifier.dart';
import 'widgets/category_items_widget.dart';
import 'widgets/cuisine_items_widget.dart';

class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(exploreCategoriesProvider);
    final cuisinesAsync = ref.watch(exploreCuisinesProvider);
    final mealsAsync = ref.watch(exploreMealsProvider);

    final exploreState = ref.watch(exploreScreenProvider);
    final notifier = ref.read(exploreScreenProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CATEGORY SECTION
                  categoriesAsync.when(
                    data: (list) => CategoryItemsWidget(
                      categories: list.map((c) => c.name).toList(),
                      selectedcategory: exploreState.selectedCategory,
                      onSelect: (name) => notifier.toggleCategory(name),
                    ),
                    loading: () => const SizedBox(
                      height: 50,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    error: (err, _) => Text('Error: $err'),
                  ),

                  const SizedBox(height: 16),

                  // CUISINE SECTION
                  cuisinesAsync.when(
                    data: (list) => CuisineItemsWidget(
                      cuisines: list,
                      selectedCuisine: exploreState.selectedCuisine,
                      onSelect: (name) => notifier.toggleCuisine(name),
                    ),
                    loading: () => const SizedBox(
                      height: 50,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    error: (err, _) => Text('Error: $err'),
                  ),
                ],
              ),
            ),

            // THE MEAL LIST AREA
            mealsAsync.when(
              data: (meals) {
                if (exploreState.selectedCategory == null &&
                    exploreState.selectedCuisine == null) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Center(
                      child: Text(
                        "Please select a Category or Cuisine to filter",
                      ),
                    ),
                  );
                }

                if (meals.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Center(child: Text("Not Found")),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        "Founded Meal",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: MealCardItems(meals: meals),
                    ),

                    const SizedBox(height: 40),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text("Error: $err")),
            ),
          ],
        ),
      ),
    );
  }
}
