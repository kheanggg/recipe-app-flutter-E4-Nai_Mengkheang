import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:recipe_finder_flutter/shared/domain/model/category.dart';
import 'package:recipe_finder_flutter/features/home/ui/widgets/category_card_widget.dart';

class CategoryItemsWidget extends StatelessWidget {
  final List<Category> categories;
  final void Function(Category)? onCategoryTap;

  const CategoryItemsWidget({super.key, required this.categories, this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140, // Set a fixed height for the horizontal list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCardWidget(
            category: categories[index],
            onTap: () => onCategoryTap?.call(categories[index]),
          );
        },
      ),
    );
  }
}