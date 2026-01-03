import 'package:recipe_finder_flutter/shared/data/database.dart';

class FavoritesRepository {
  final AppDatabase _db;

  FavoritesRepository(this._db);

  Stream<List<String>> watchFavoriteIds() {
    return _db.select(_db.favoriteMeals)
        .map((row) => row.mealId)
        .watch();
  }

  Future<void> toggleFavorite(String id) async {
    final exists = await (_db.select(_db.favoriteMeals)
          ..where((t) => t.mealId.equals(id)))
        .getSingleOrNull();

    if (exists != null) {
      await (_db.delete(_db.favoriteMeals)..where((t) => t.mealId.equals(id))).go();
    } else {
      await _db.into(_db.favoriteMeals).insert(FavoriteMealsCompanion.insert(mealId: id));
    }
  }
}