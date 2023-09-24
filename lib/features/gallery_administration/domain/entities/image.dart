import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';
part 'image.g.dart';

@freezed
class Image with _$Image {
  const factory Image({
    int? id,
    required int userId,
    required int categoryId,
    required String url,
    required String filename,
    required String originalFilename,
    required int fileSize,
    required String mimeType,
    required DateTime uploadDate,
    required DateTime lastModifiedDate,
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
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
