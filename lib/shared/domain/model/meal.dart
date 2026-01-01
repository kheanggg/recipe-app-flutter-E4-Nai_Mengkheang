import 'package:json_annotation/json_annotation.dart';

part 'meal.g.dart';

@JsonSerializable(explicitToJson: true)
class Meal {
  @JsonKey(fromJson: _stringToInt)
  final int id;

  @JsonKey(name: 'meal')
  final String name;

  final String category;
  final String area;
  final String instructions;

  @JsonKey(name: 'mealThumb')
  final String thumbnailUrl;

  final String? tags;
  final String? youtube;
  final String? source;

  final List<Ingredient> ingredients;

  @JsonKey(defaultValue: false)
  final bool isFavorite;

  Meal({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.thumbnailUrl,
    this.tags,
    this.youtube,
    this.source,
    required this.ingredients,
    this.isFavorite = false,
  });

  // Factory method for deserialization
  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  // Method for serialization
  Map<String, dynamic> toJson() => _$MealToJson(this);
  
  static int _stringToInt(dynamic value) {
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? 0;
      return 0;
    }
}

@JsonSerializable()
class Ingredient {
  final String ingredient;
  final String measure;

  Ingredient({
    required this.ingredient,
    required this.measure,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
