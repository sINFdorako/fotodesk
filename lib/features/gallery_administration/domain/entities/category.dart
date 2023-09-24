import 'package:freezed_annotation/freezed_annotation.dart';
import 'image.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    int? id,
    required int userId,
    required String name,
    required DateTime creationDate,
    required DateTime lastModifiedDate,
    String? description,
    List<Image>? images,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
