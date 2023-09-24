// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Image _$$_ImageFromJson(Map<String, dynamic> json) => _$_Image(
      id: json['id'] as int?,
      userId: json['userId'] as int,
      categoryId: json['categoryId'] as int,
      url: json['url'] as String,
      filename: json['filename'] as String,
      originalFilename: json['originalFilename'] as String,
      fileSize: json['fileSize'] as int,
      mimeType: json['mimeType'] as String,
      uploadDate: DateTime.parse(json['uploadDate'] as String),
      lastModifiedDate: DateTime.parse(json['lastModifiedDate'] as String),
      title: json['title'] as String?,
      description: json['description'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      cameraMake: json['cameraMake'] as String?,
      cameraModel: json['cameraModel'] as String?,
      exposureTime: (json['exposureTime'] as num?)?.toDouble(),
      aperture: (json['aperture'] as num?)?.toDouble(),
      iso: json['iso'] as int?,
      focalLength: (json['focalLength'] as num?)?.toDouble(),
      flashUsed: json['flashUsed'] as bool?,
      creator: json['creator'] as String?,
      copyright: json['copyright'] as String?,
      creationDate: json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
    );

Map<String, dynamic> _$$_ImageToJson(_$_Image instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'categoryId': instance.categoryId,
      'url': instance.url,
      'filename': instance.filename,
      'originalFilename': instance.originalFilename,
      'fileSize': instance.fileSize,
      'mimeType': instance.mimeType,
      'uploadDate': instance.uploadDate.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'tags': instance.tags,
      'cameraMake': instance.cameraMake,
      'cameraModel': instance.cameraModel,
      'exposureTime': instance.exposureTime,
      'aperture': instance.aperture,
      'iso': instance.iso,
      'focalLength': instance.focalLength,
      'flashUsed': instance.flashUsed,
      'creator': instance.creator,
      'copyright': instance.copyright,
      'creationDate': instance.creationDate?.toIso8601String(),
    };
