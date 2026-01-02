import 'package:flutter/material.dart';
import 'package:recipe_finder_flutter/shared/widgets/app_chip_widget.dart';

class CuisineItemsWidget extends StatelessWidget {
  final List<String> cuisines;
  final String? selectedCuisine; // Renamed for clarity
  final Function(String) onSelect;

  const CuisineItemsWidget({
    super.key,
    required this.cuisines,
    required this.selectedCuisine,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Cuisine", 
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        
        const SizedBox(height: 12),
        
        SizedBox(
          height: 45,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cuisines.length,
            itemBuilder: (context, index) {
              final cuisineName = cuisines[index];
              return AppChipWidget(
                label: cuisineName,
                isSelected: cuisineName == selectedCuisine,
                onTap: () => onSelect(cuisineName),
              );
            },
          ),
        ),
      ],
    );
  }
}