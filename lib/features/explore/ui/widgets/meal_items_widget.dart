import 'package:flutter/material.dart';
import 'package:recipe_finder_flutter/features/explore/ui/widgets/meal_card_widget.dart';
import 'package:recipe_finder_flutter/routes/app_routes.dart';
import 'package:recipe_finder_flutter/shared/domain/model/meal.dart';

class MealCardItems extends StatelessWidget {
  final List<Meal> meals;

  const MealCardItems({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 16),
      
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 220,
      ),
      
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final meal = meals[index];
        return MealCard(
          name: meal.name,
          cuisine: meal.area,
          imageUrl: meal.thumbnailUrl,
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.mealDetail,
              arguments: meal,
            );
          },
        );
      },
    );
  }
}