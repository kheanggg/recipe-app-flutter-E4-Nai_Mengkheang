import 'package:flutter/material.dart';
import 'package:recipe_finder_flutter/features/home/ui/widgets/suggestion_meal_card_widget.dart';

class SuggestionMealItemsWidget extends StatelessWidget {
  final List<dynamic> meals; // Replace with your Meal model

  const SuggestionMealItemsWidget({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Height to accommodate image + two lines of text
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return SuggestionMealCard(
            name: meal.name,
            cuisine: meal.area ?? 'Unknown',
            imageUrl: meal.thumbnailUrl,
            onTap: () => print('Tapped ${meal.id}'),
          );
        },
      ),
    );
  }
}