// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
  id: Meal._stringToInt(json['id']),
  title: json['meal'] as String,
  category: json['category'] as String,
  area: json['area'] as String,
  instructions: json['instructions'] as String,
  imageUrl: json['mealThumb'] as String,
  tags: json['tags'] as String?,
  youtube: json['youtube'] as String?,
  source: json['source'] as String?,
  ingredients: (json['ingredients'] as List<dynamic>)
      .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
      .toList(),
  isFavorite: json['isFavorite'] as bool? ?? false,
);

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
  'id': instance.id,
  'meal': instance.title,
  'category': instance.category,
  'area': instance.area,
  'instructions': instance.instructions,
  'mealThumb': instance.imageUrl,
  'tags': instance.tags,
  'youtube': instance.youtube,
  'source': instance.source,
  'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
  'isFavorite': instance.isFavorite,
};

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
  ingredient: json['ingredient'] as String,
  measure: json['measure'] as String,
);

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'ingredient': instance.ingredient,
      'measure': instance.measure,
    };
