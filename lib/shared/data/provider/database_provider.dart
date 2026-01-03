import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:recipe_finder_flutter/shared/data/database.dart';
import 'package:recipe_finder_flutter/shared/data/repository/favorite_repository.dart';
import 'package:recipe_finder_flutter/shared/domain/model/meal.dart';
import 'package:recipe_finder_flutter/shared/data/repository/meal_repository.dart';

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) { 
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
}

@riverpod
FavoritesRepository favoritesRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return FavoritesRepository(db);
}

@riverpod
class FavoriteIds extends _$FavoriteIds {
  @override
  Stream<List<String>> build() {
    final repo = ref.watch(favoritesRepositoryProvider);
    
    return repo.watchFavoriteIds();
  }

  Future<void> toggle(String mealId) async {
    final repo = ref.read(favoritesRepositoryProvider);
    await repo.toggleFavorite(mealId);
    
    final currentIds = await repo.watchFavoriteIds().first;
    print('Current IDs in DB: $currentIds'); 
  }
}

@riverpod
Future<List<Meal>> favoriteMeals(Ref ref) async {
  final favoriteIds = await ref.watch(favoriteIdsProvider.future);
  final mealRepo = ref.watch(mealRepositoryProvider);

  final meals = await Future.wait(
    favoriteIds.map((idStr) {
      final id = int.tryParse(idStr);
      if (id != null) return mealRepo.getMealById(id);
      return Future.value(null);
    }),
  );

  return meals.whereType<Meal>().toList();
}
