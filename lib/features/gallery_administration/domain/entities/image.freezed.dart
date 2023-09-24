// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Image _$ImageFromJson(Map<String, dynamic> json) {
  return _Image.fromJson(json);
}

/// @nodoc
mixin _$Image {
  int? get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get filename => throw _privateConstructorUsedError;
  String get originalFilename => throw _privateConstructorUsedError;
  int get fileSize => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;
  DateTime get uploadDate => throw _privateConstructorUsedError;
  DateTime get lastModifiedDate => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError; // EXIF-Daten
  String? get cameraMake => throw _privateConstructorUsedError;
  String? get cameraModel => throw _privateConstructorUsedError;
  double? get exposureTime => throw _privateConstructorUsedError;
  double? get aperture => throw _privateConstructorUsedError;
  int? get iso => throw _privateConstructorUsedError;
  double? get focalLength => throw _privateConstructorUsedError;
  bool? get flashUsed => throw _privateConstructorUsedError; // IPTC-Daten
  String? get creator => throw _privateConstructorUsedError;
  String? get copyright => throw _privateConstructorUsedError;
  DateTime? get creationDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageCopyWith<Image> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCopyWith<$Res> {
  factory $ImageCopyWith(Image value, $Res Function(Image) then) =
      _$ImageCopyWithImpl<$Res, Image>;
  @useResult
  $Res call(
      {int? id,
      int userId,
      int categoryId,
      String url,
      String filename,
      String originalFilename,
      int fileSize,
      String mimeType,
      DateTime uploadDate,
      DateTime lastModifiedDate,
      String? title,
      String? description,
      List<String>? tags,
      String? cameraMake,
      String? cameraModel,
      double? exposureTime,
      double? aperture,
      int? iso,
      double? focalLength,
      bool? flashUsed,
      String? creator,
      String? copyright,
      DateTime? creationDate});
}

/// @nodoc
class _$ImageCopyWithImpl<$Res, $Val extends Image>
    implements $ImageCopyWith<$Res> {
  _$ImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? categoryId = null,
    Object? url = null,
    Object? filename = null,
    Object? originalFilename = null,
    Object? fileSize = null,
    Object? mimeType = null,
    Object? uploadDate = null,
    Object? lastModifiedDate = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? tags = freezed,
    Object? cameraMake = freezed,
    Object? cameraModel = freezed,
    Object? exposureTime = freezed,
    Object? aperture = freezed,
    Object? iso = freezed,
    Object? focalLength = freezed,
    Object? flashUsed = freezed,
    Object? creator = freezed,
    Object? copyright = freezed,
    Object? creationDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      originalFilename: null == originalFilename
          ? _value.originalFilename
          : originalFilename // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      uploadDate: null == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModifiedDate: null == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      cameraMake: freezed == cameraMake
          ? _value.cameraMake
          : cameraMake // ignore: cast_nullable_to_non_nullable
              as String?,
      cameraModel: freezed == cameraModel
          ? _value.cameraModel
          : cameraModel // ignore: cast_nullable_to_non_nullable
              as String?,
      exposureTime: freezed == exposureTime
          ? _value.exposureTime
          : exposureTime // ignore: cast_nullable_to_non_nullable
              as double?,
      aperture: freezed == aperture
          ? _value.aperture
          : aperture // ignore: cast_nullable_to_non_nullable
              as double?,
      iso: freezed == iso
          ? _value.iso
          : iso // ignore: cast_nullable_to_non_nullable
              as int?,
      focalLength: freezed == focalLength
          ? _value.focalLength
          : focalLength // ignore: cast_nullable_to_non_nullable
              as double?,
      flashUsed: freezed == flashUsed
          ? _value.flashUsed
          : flashUsed // ignore: cast_nullable_to_non_nullable
              as bool?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String?,
      copyright: freezed == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageCopyWith<$Res> implements $ImageCopyWith<$Res> {
  factory _$$_ImageCopyWith(_$_Image value, $Res Function(_$_Image) then) =
      __$$_ImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int userId,
      int categoryId,
      String url,
      String filename,
      String originalFilename,
      int fileSize,
      String mimeType,
      DateTime uploadDate,
      DateTime lastModifiedDate,
      String? title,
      String? description,
      List<String>? tags,
      String? cameraMake,
      String? cameraModel,
      double? exposureTime,
      double? aperture,
      int? iso,
      double? focalLength,
      bool? flashUsed,
      String? creator,
      String? copyright,
      DateTime? creationDate});
}

/// @nodoc
class __$$_ImageCopyWithImpl<$Res> extends _$ImageCopyWithImpl<$Res, _$_Image>
    implements _$$_ImageCopyWith<$Res> {
  __$$_ImageCopyWithImpl(_$_Image _value, $Res Function(_$_Image) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? categoryId = null,
    Object? url = null,
    Object? filename = null,
    Object? originalFilename = null,
    Object? fileSize = null,
    Object? mimeType = null,
    Object? uploadDate = null,
    Object? lastModifiedDate = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? tags = freezed,
    Object? cameraMake = freezed,
    Object? cameraModel = freezed,
    Object? exposureTime = freezed,
    Object? aperture = freezed,
    Object? iso = freezed,
    Object? focalLength = freezed,
    Object? flashUsed = freezed,
    Object? creator = freezed,
    Object? copyright = freezed,
    Object? creationDate = freezed,
  }) {
    return _then(_$_Image(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      originalFilename: null == originalFilename
          ? _value.originalFilename
          : originalFilename // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      uploadDate: null == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModifiedDate: null == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      cameraMake: freezed == cameraMake
          ? _value.cameraMake
          : cameraMake // ignore: cast_nullable_to_non_nullable
              as String?,
      cameraModel: freezed == cameraModel
          ? _value.cameraModel
          : cameraModel // ignore: cast_nullable_to_non_nullable
              as String?,
      exposureTime: freezed == exposureTime
          ? _value.exposureTime
          : exposureTime // ignore: cast_nullable_to_non_nullable
              as double?,
      aperture: freezed == aperture
          ? _value.aperture
          : aperture // ignore: cast_nullable_to_non_nullable
              as double?,
      iso: freezed == iso
          ? _value.iso
          : iso // ignore: cast_nullable_to_non_nullable
              as int?,
      focalLength: freezed == focalLength
          ? _value.focalLength
          : focalLength // ignore: cast_nullable_to_non_nullable
              as double?,
      flashUsed: freezed == flashUsed
          ? _value.flashUsed
          : flashUsed // ignore: cast_nullable_to_non_nullable
              as bool?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String?,
      copyright: freezed == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Image implements _Image {
  const _$_Image(
      {this.id,
      required this.userId,
      required this.categoryId,
      required this.url,
      required this.filename,
      required this.originalFilename,
      required this.fileSize,
      required this.mimeType,
      required this.uploadDate,
      required this.lastModifiedDate,
      this.title,
      this.description,
      final List<String>? tags,
      this.cameraMake,
      this.cameraModel,
      this.exposureTime,
      this.aperture,
      this.iso,
      this.focalLength,
      this.flashUsed,
      this.creator,
      this.copyright,
      this.creationDate})
      : _tags = tags;

  factory _$_Image.fromJson(Map<String, dynamic> json) =>
      _$$_ImageFromJson(json);

  @override
  final int? id;
  @override
  final int userId;
  @override
  final int categoryId;
  @override
  final String url;
  @override
  final String filename;
  @override
  final String originalFilename;
  @override
  final int fileSize;
  @override
  final String mimeType;
  @override
  final DateTime uploadDate;
  @override
  final DateTime lastModifiedDate;
  @override
  final String? title;
  @override
  final String? description;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// EXIF-Daten
  @override
  final String? cameraMake;
  @override
  final String? cameraModel;
  @override
  final double? exposureTime;
  @override
  final double? aperture;
  @override
  final int? iso;
  @override
  final double? focalLength;
  @override
  final bool? flashUsed;
// IPTC-Daten
  @override
  final String? creator;
  @override
  final String? copyright;
  @override
  final DateTime? creationDate;

  @override
  String toString() {
    return 'Image(id: $id, userId: $userId, categoryId: $categoryId, url: $url, filename: $filename, originalFilename: $originalFilename, fileSize: $fileSize, mimeType: $mimeType, uploadDate: $uploadDate, lastModifiedDate: $lastModifiedDate, title: $title, description: $description, tags: $tags, cameraMake: $cameraMake, cameraModel: $cameraModel, exposureTime: $exposureTime, aperture: $aperture, iso: $iso, focalLength: $focalLength, flashUsed: $flashUsed, creator: $creator, copyright: $copyright, creationDate: $creationDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Image &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.originalFilename, originalFilename) ||
                other.originalFilename == originalFilename) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.uploadDate, uploadDate) ||
                other.uploadDate == uploadDate) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.cameraMake, cameraMake) ||
                other.cameraMake == cameraMake) &&
            (identical(other.cameraModel, cameraModel) ||
                other.cameraModel == cameraModel) &&
            (identical(other.exposureTime, exposureTime) ||
                other.exposureTime == exposureTime) &&
            (identical(other.aperture, aperture) ||
                other.aperture == aperture) &&
            (identical(other.iso, iso) || other.iso == iso) &&
            (identical(other.focalLength, focalLength) ||
                other.focalLength == focalLength) &&
            (identical(other.flashUsed, flashUsed) ||
                other.flashUsed == flashUsed) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.copyright, copyright) ||
                other.copyright == copyright) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        categoryId,
        url,
        filename,
        originalFilename,
        fileSize,
        mimeType,
        uploadDate,
        lastModifiedDate,
        title,
        description,
        const DeepCollectionEquality().hash(_tags),
        cameraMake,
        cameraModel,
        exposureTime,
        aperture,
        iso,
        focalLength,
        flashUsed,
        creator,
        copyright,
        creationDate
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageCopyWith<_$_Image> get copyWith =>
      __$$_ImageCopyWithImpl<_$_Image>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageToJson(
      this,
    );
  }
}

abstract class _Image implements Image {
  const factory _Image(
      {final int? id,
      required final int userId,
      required final int categoryId,
      required final String url,
      required final String filename,
      required final String originalFilename,
      required final int fileSize,
      required final String mimeType,
      required final DateTime uploadDate,
      required final DateTime lastModifiedDate,
      final String? title,
      final String? description,
      final List<String>? tags,
      final String? cameraMake,
      final String? cameraModel,
      final double? exposureTime,
      final double? aperture,
      final int? iso,
      final double? focalLength,
      final bool? flashUsed,
      final String? creator,
      final String? copyright,
      final DateTime? creationDate}) = _$_Image;

  factory _Image.fromJson(Map<String, dynamic> json) = _$_Image.fromJson;

  @override
  int? get id;
  @override
  int get userId;
  @override
  int get categoryId;
  @override
  String get url;
  @override
  String get filename;
  @override
  String get originalFilename;
  @override
  int get fileSize;
  @override
  String get mimeType;
  @override
  DateTime get uploadDate;
  @override
  DateTime get lastModifiedDate;
  @override
  String? get title;
  @override
  String? get description;
  @override
  List<String>? get tags;
  @override // EXIF-Daten
  String? get cameraMake;
  @override
  String? get cameraModel;
  @override
  double? get exposureTime;
  @override
  double? get aperture;
  @override
  int? get iso;
  @override
  double? get focalLength;
  @override
  bool? get flashUsed;
  @override // IPTC-Daten
  String? get creator;
  @override
  String? get copyright;
  @override
  DateTime? get creationDate;
  @override
  @JsonKey(ignore: true)
  _$$_ImageCopyWith<_$_Image> get copyWith =>
      throw _privateConstructorUsedError;
}
