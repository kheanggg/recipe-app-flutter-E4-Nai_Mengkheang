import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:recipe_finder_flutter/shared/constants/app_colors.dart';

class PopularMealCard extends StatelessWidget {
  final String name;
  final String cuisine;
  final String imageUrl;
  final VoidCallback? onTap;

  const PopularMealCard({
    super.key,
    required this.name,
    required this.cuisine,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              // 1. The Image
              CachedNetworkImage(
                imageUrl: imageUrl,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: Colors.grey[200]),
                errorWidget: (context, url, error) => const Icon(Icons.broken_image),
              ),
              // 2. The Dark Gradient (to make white text pop)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppColors.primaryColor.withOpacity(0.6),
                    ],
                  ),
                ),
              ),
              // 3. The Text Labels
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Cuisine: $cuisine',
                      style: const TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}