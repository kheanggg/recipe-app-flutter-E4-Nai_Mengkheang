import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_finder_flutter/features/home/ui/widgets/category_items_widget.dart';
// Import your new widgets
import 'package:recipe_finder_flutter/features/home/ui/widgets/popular_meal_items_widget.dart'; 
import 'package:recipe_finder_flutter/features/home/ui/widgets/suggestion_meal_items_widget.dart';
import 'package:recipe_finder_flutter/features/home/ui/widgets/cuisine_items_widget.dart';
import 'package:recipe_finder_flutter/features/home/ui/notifiers/home_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch both providers
    final categoriesAsync = ref.watch(homeCategoriesProvider);
    final popularMealsAsync = ref.watch(homeMealsProvider(category: null));
    final suggestionMealsAsync = ref.watch(homeMealsProvider(category: null));
    final cuisinesAsync = ref.watch(homeCuisinesProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Categories Section ---
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            categoriesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
              data: (categories) => CategoryItemsWidget(categories: categories),
            ),

            // --- Cuisines Section ---
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Text(
                'Cuisines',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            cuisinesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
              data: (cuisineList) => CuisineItemsWidget(
                cuisines: cuisineList,
                onSelect: (selectedCuisine) {
                  print("Selected: $selectedCuisine");
                },
              ),
            ),

            // --- Popular Meals Section ---
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Text(
                'Popular Meals',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            
            popularMealsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
              data: (meals) => PopularMealItemsWidget(meals: meals),
            ),

            // --- Suggestion Meals Section ---
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Text(
                'Suggestion Meals',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            
            suggestionMealsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
              data: (meals) => SuggestionMealItemsWidget(meals: meals),
            ),
                        
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}