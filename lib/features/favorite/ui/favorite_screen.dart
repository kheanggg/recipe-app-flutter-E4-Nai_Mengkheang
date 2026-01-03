import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_finder_flutter/shared/data/provider/database_provider.dart';
import 'package:recipe_finder_flutter/features/favorite/ui/widgets/meal_items_widget.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoriteMealsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
        centerTitle: true,
      ),

      body: favoritesAsync.when(
        data: (favoriteMealsList) {
          if (favoriteMealsList.isEmpty) {
            return const Center(
              child: Text(
                'You haven\'t added any favorites yet!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MealCardItems(meals: favoriteMealsList),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Text('Error loading favorites: $err'),
        ),
      ),
    );
  }
}