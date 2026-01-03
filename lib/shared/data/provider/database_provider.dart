import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:recipe_finder_flutter/shared/data/database.dart';
import 'package:recipe_finder_flutter/shared/data/repository/favorite_repository.dart';

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
  }
}