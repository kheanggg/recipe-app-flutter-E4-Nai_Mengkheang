import 'package:flutter/material.dart';
import 'package:recipe_finder_flutter/shared/domain/model/meal.dart';
import 'package:recipe_finder_flutter/shared/constants/app_colors.dart';
import 'package:recipe_finder_flutter/features/meal/ui/widgets/favorite_button_widget.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // We use a CustomScrollView to allow the AppBar to interact with the scroll
      body: CustomScrollView(
        slivers: [
          // 1. The Header that stays over the image
          SliverAppBar(
            expandedHeight: 350.0,
            pinned: true, // Keeps a slim bar at the top when scrolling down
            stretch: true, // Allows the image to zoom slightly when pulled
            backgroundColor: AppColors.primaryColor,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // The Meal Image
                  Image.network(meal.thumbnailUrl, fit: BoxFit.cover),
                ],
              ),
            ),
          ),

          // 2. The Content Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align to top
                    children: [
                      // 1. Wrap the name in Expanded
                      Expanded(
                        child: Text(
                          meal.name,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                          // No need for maxLines if you want it to grow vertically
                        ),
                      ),

                      const SizedBox(width: 10), // Small gap

                      FavoriteButton(mealId: meal.id.toString()),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Area: ${meal.area}",
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),

                  const SizedBox(height: 5),
                  Text(
                    "Category: ${meal.category}",
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),

                  const Divider(height: 40),

                  // Instructions Section
                  const Text(
                    "Instructions",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    meal.instructions,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
