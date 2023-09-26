import 'package:freezed_annotation/freezed_annotation.dart';
import 'gallery_image.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    int? id,
    int? userId,
    required String name,
    DateTime? creationDate,
    DateTime? lastModifiedDate,
    String? description,
    int? size,
    List<GalleryImage>? images,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
