import 'package:flutter/material.dart';
import 'package:recipe_finder_flutter/features/home/ui/widgets/popular_meal_card_widget.dart';

class PopularMealItemsWidget extends StatelessWidget {
  final List<dynamic> meals; // Replace 'dynamic' with your Meal model

  const PopularMealItemsWidget({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220, // Height of the meal cards
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return PopularMealCard(
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