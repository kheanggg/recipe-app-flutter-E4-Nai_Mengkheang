import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

// run command    flutter pub run build_runner build
// or watch    flutter pub run build_runner watch
@JsonSerializable()
class Category {
  @JsonKey(fromJson: _stringToInt)
  final int id;


  @JsonKey(name: 'category')
  final String name; 

  @JsonKey(name: 'categoryThumb')
  final String? thumbnailUrl;

  Category({
    required this.id,
    required this.name,
    this.thumbnailUrl,
  });

  // Factory method for deserialization - connects to generated code
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  // Method for serialization - connects to generated code
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  static int _stringToInt(dynamic value) {
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? 0;
      return 0;
    }
}