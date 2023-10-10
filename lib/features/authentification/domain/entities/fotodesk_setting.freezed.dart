// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fotodesk_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FotodeskSetting _$FotodeskSettingFromJson(Map<String, dynamic> json) {
  return _FotodeskSetting.fromJson(json);
}

/// @nodoc
mixin _$FotodeskSetting {
  List<String> get packages => throw _privateConstructorUsedError;
  int get appSizeInGB => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  int? get trialInMonths => throw _privateConstructorUsedError;
  double? get pricePerMonth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FotodeskSettingCopyWith<FotodeskSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FotodeskSettingCopyWith<$Res> {
  factory $FotodeskSettingCopyWith(
          FotodeskSetting value, $Res Function(FotodeskSetting) then) =
      _$FotodeskSettingCopyWithImpl<$Res, FotodeskSetting>;
  @useResult
  $Res call(
      {List<String> packages,
      int appSizeInGB,
      int? id,
      int? userId,
      int? trialInMonths,
      double? pricePerMonth});
}

/// @nodoc
class _$FotodeskSettingCopyWithImpl<$Res, $Val extends FotodeskSetting>
    implements $FotodeskSettingCopyWith<$Res> {
  _$FotodeskSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packages = null,
    Object? appSizeInGB = null,
    Object? id = freezed,
    Object? userId = freezed,
    Object? trialInMonths = freezed,
    Object? pricePerMonth = freezed,
  }) {
    return _then(_value.copyWith(
      packages: null == packages
          ? _value.packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      appSizeInGB: null == appSizeInGB
          ? _value.appSizeInGB
          : appSizeInGB // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      trialInMonths: freezed == trialInMonths
          ? _value.trialInMonths
          : trialInMonths // ignore: cast_nullable_to_non_nullable
              as int?,
      pricePerMonth: freezed == pricePerMonth
          ? _value.pricePerMonth
          : pricePerMonth // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FotodeskSettingCopyWith<$Res>
    implements $FotodeskSettingCopyWith<$Res> {
  factory _$$_FotodeskSettingCopyWith(
          _$_FotodeskSetting value, $Res Function(_$_FotodeskSetting) then) =
      __$$_FotodeskSettingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> packages,
      int appSizeInGB,
      int? id,
      int? userId,
      int? trialInMonths,
      double? pricePerMonth});
}

/// @nodoc
class __$$_FotodeskSettingCopyWithImpl<$Res>
    extends _$FotodeskSettingCopyWithImpl<$Res, _$_FotodeskSetting>
    implements _$$_FotodeskSettingCopyWith<$Res> {
  __$$_FotodeskSettingCopyWithImpl(
      _$_FotodeskSetting _value, $Res Function(_$_FotodeskSetting) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packages = null,
    Object? appSizeInGB = null,
    Object? id = freezed,
    Object? userId = freezed,
    Object? trialInMonths = freezed,
    Object? pricePerMonth = freezed,
  }) {
    return _then(_$_FotodeskSetting(
      packages: null == packages
          ? _value._packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      appSizeInGB: null == appSizeInGB
          ? _value.appSizeInGB
          : appSizeInGB // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      trialInMonths: freezed == trialInMonths
          ? _value.trialInMonths
          : trialInMonths // ignore: cast_nullable_to_non_nullable
              as int?,
      pricePerMonth: freezed == pricePerMonth
          ? _value.pricePerMonth
          : pricePerMonth // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FotodeskSetting implements _FotodeskSetting {
  const _$_FotodeskSetting(
      {required final List<String> packages,
      required this.appSizeInGB,
      this.id,
      this.userId,
      this.trialInMonths,
      this.pricePerMonth})
      : _packages = packages;

  factory _$_FotodeskSetting.fromJson(Map<String, dynamic> json) =>
      _$$_FotodeskSettingFromJson(json);

  final List<String> _packages;
  @override
  List<String> get packages {
    if (_packages is EqualUnmodifiableListView) return _packages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_packages);
  }

  @override
  final int appSizeInGB;
  @override
  final int? id;
  @override
  final int? userId;
  @override
  final int? trialInMonths;
  @override
  final double? pricePerMonth;

  @override
  String toString() {
    return 'FotodeskSetting(packages: $packages, appSizeInGB: $appSizeInGB, id: $id, userId: $userId, trialInMonths: $trialInMonths, pricePerMonth: $pricePerMonth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FotodeskSetting &&
            const DeepCollectionEquality().equals(other._packages, _packages) &&
            (identical(other.appSizeInGB, appSizeInGB) ||
                other.appSizeInGB == appSizeInGB) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.trialInMonths, trialInMonths) ||
                other.trialInMonths == trialInMonths) &&
            (identical(other.pricePerMonth, pricePerMonth) ||
                other.pricePerMonth == pricePerMonth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_packages),
      appSizeInGB,
      id,
      userId,
      trialInMonths,
      pricePerMonth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FotodeskSettingCopyWith<_$_FotodeskSetting> get copyWith =>
      __$$_FotodeskSettingCopyWithImpl<_$_FotodeskSetting>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FotodeskSettingToJson(
      this,
    );
  }
}

abstract class _FotodeskSetting implements FotodeskSetting {
  const factory _FotodeskSetting(
      {required final List<String> packages,
      required final int appSizeInGB,
      final int? id,
      final int? userId,
      final int? trialInMonths,
      final double? pricePerMonth}) = _$_FotodeskSetting;

  factory _FotodeskSetting.fromJson(Map<String, dynamic> json) =
      _$_FotodeskSetting.fromJson;

  @override
  List<String> get packages;
  @override
  int get appSizeInGB;
  @override
  int? get id;
  @override
  int? get userId;
  @override
  int? get trialInMonths;
  @override
  double? get pricePerMonth;
  @override
  @JsonKey(ignore: true)
  _$$_FotodeskSettingCopyWith<_$_FotodeskSetting> get copyWith =>
      throw _privateConstructorUsedError;
}
