// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  id: Category._stringToInt(json['id']),
  name: json['category'] as String,
  thumbnailUrl: json['categoryThumb'] as String?,
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'id': instance.id,
  'category': instance.name,
  'categoryThumb': instance.thumbnailUrl,
};
