import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:recipe_finder_flutter/shared/constants/app_colors.dart';
import 'package:recipe_finder_flutter/shared/domain/model/category.dart';

class CategoryCardWidget extends StatelessWidget {
  final Category category;
  final VoidCallback? onTap;

  const CategoryCardWidget({super.key, required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    // Define a single size variable to ensure it stays square
    const double squareSize = 100.0; 

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: squareSize, 
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: squareSize,
              width: squareSize,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20), 
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: category.thumbnailUrl ?? '',
                  fit: BoxFit.contain, 
                  placeholder: (context, url) => const Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.fastfood),
                ),
              ),
            ),
            const SizedBox(height: 8), 
            // The Text Label
            Text(
              category.name,
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}