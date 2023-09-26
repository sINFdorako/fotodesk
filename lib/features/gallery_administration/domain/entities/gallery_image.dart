import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_image.freezed.dart';
part 'gallery_image.g.dart';

@freezed
class GalleryImage with _$GalleryImage {
  const factory GalleryImage({
    int? id,
    int? userId,
    int? categoryId,
    String? url,
    String? filename,
    String? originalFilename,
    int? fileSize,
    String? mimeType,
    DateTime? uploadDate,
    DateTime? lastModifiedDate,
    String? title,
    String? description,
    List<String>? tags,

    // EXIF-Daten
    String? cameraMake,
    String? cameraModel,
    double? exposureTime,
    double? aperture,
    int? iso,
    double? focalLength,
    bool? flashUsed,

    // IPTC-Daten
    String? creator,
    String? copyright,
    DateTime? creationDate,
  }) = _GalleryImage;

  factory GalleryImage.fromJson(Map<String, dynamic> json) =>
      _$GalleryImageFromJson(json);
}
