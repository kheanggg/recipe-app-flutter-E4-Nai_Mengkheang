import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_finder_flutter/shared/data/provider/database_provider.dart';

class FavoriteButton extends ConsumerWidget {
  final String mealId;
  const FavoriteButton({super.key, required this.mealId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoriteIdsProvider);

    return favoritesAsync.when(
      data: (favoriteList) {
        final isFavorite = favoriteList.contains(mealId);
        return IconButton(
          iconSize: 30, 
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
            size: 30,
          ),
          onPressed: () {
            ref.read(favoriteIdsProvider.notifier).toggle(mealId);
          },
        );
      },
      loading: () => const SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
      error: (err, stack) => const Icon(Icons.error, size: 30),
    );
  }
}