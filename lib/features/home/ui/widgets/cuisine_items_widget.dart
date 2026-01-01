import 'package:flutter/material.dart';
import 'package:recipe_finder_flutter/features/home/ui/widgets/cuisine_card_widget.dart';

class CuisineItemsWidget extends StatelessWidget {
  final List<String> cuisines;
  final String? selectedCuisine;

  const CuisineItemsWidget({
    super.key,
    required this.cuisines,
    this.selectedCuisine
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: cuisines.length,
        itemBuilder: (context, index) {
          final cuisine = cuisines[index];
          return CuisineCard(
            cuisine: cuisine,
            isSelected: cuisine == selectedCuisine,
            onTap: () => {
              // Handle cuisine selection
            },
          );
        },
      ),
    );
  }
}