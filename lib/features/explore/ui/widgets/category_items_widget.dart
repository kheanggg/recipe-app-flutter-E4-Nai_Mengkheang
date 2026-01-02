import 'package:flutter/material.dart';
import 'package:recipe_finder_flutter/shared/widgets/app_chip_widget.dart';

class CategoryItemsWidget extends StatelessWidget {
  final List<String> categories;
  final String? selectedcategory;
  final Function(String) onSelect;

  const CategoryItemsWidget({
    super.key,
    required this.categories,
    required this.selectedcategory,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Category", 
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 45,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final categoryName = categories[index];
              return AppChipWidget(
                label: categoryName,
                isSelected: categoryName == selectedcategory,
                onTap: () => onSelect(categoryName),
              );
            },
          ),
        ),
      ],
    );
  }
}