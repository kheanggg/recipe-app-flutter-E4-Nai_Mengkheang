import 'package:flutter/material.dart';
import 'package:recipe_finder_flutter/features/home/ui/widgets/cuisine_card_widget.dart';

class CuisineItemsWidget extends StatelessWidget {
  final List<String> cuisines;
  final String? selectedCuisine;
  final Function(String) onSelect;

  const CuisineItemsWidget({
    super.key,
    required this.cuisines,
    this.selectedCuisine,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45, // Fixed height for the chip row
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: cuisines.length,
        itemBuilder: (context, index) {
          final cuisine = cuisines[index];
          return CuisineCard(
            cuisine: cuisine,
            isSelected: cuisine == selectedCuisine,
            onTap: () => onSelect(cuisine),
          );
        },
      ),
    );
  }
}