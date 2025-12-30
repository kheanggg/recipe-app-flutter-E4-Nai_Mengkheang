import 'package:recipe_finder_flutter/shared/domain/model/category.dart';


class CategorySectionData {
  final String title;
  final List<Category> categories;

  CategorySectionData({
    required this.title,
    required this.categories,
  });
}