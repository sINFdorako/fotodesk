// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_manager_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdminManagerState {
  NavBarItem get selectedType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdminManagerStateCopyWith<AdminManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminManagerStateCopyWith<$Res> {
  factory $AdminManagerStateCopyWith(
          AdminManagerState value, $Res Function(AdminManagerState) then) =
      _$AdminManagerStateCopyWithImpl<$Res, AdminManagerState>;
  @useResult
  $Res call({NavBarItem selectedType});
}

/// @nodoc
class _$AdminManagerStateCopyWithImpl<$Res, $Val extends AdminManagerState>
    implements $AdminManagerStateCopyWith<$Res> {
  _$AdminManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedType = null,
  }) {
    return _then(_value.copyWith(
      selectedType: null == selectedType
          ? _value.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as NavBarItem,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdminManagerStateCopyWith<$Res>
    implements $AdminManagerStateCopyWith<$Res> {
  factory _$$_AdminManagerStateCopyWith(_$_AdminManagerState value,
          $Res Function(_$_AdminManagerState) then) =
      __$$_AdminManagerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NavBarItem selectedType});
}

/// @nodoc
class __$$_AdminManagerStateCopyWithImpl<$Res>
    extends _$AdminManagerStateCopyWithImpl<$Res, _$_AdminManagerState>
    implements _$$_AdminManagerStateCopyWith<$Res> {
  __$$_AdminManagerStateCopyWithImpl(
      _$_AdminManagerState _value, $Res Function(_$_AdminManagerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedType = null,
  }) {
    return _then(_$_AdminManagerState(
      selectedType: null == selectedType
          ? _value.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as NavBarItem,
    ));
  }
}

/// @nodoc

class _$_AdminManagerState implements _AdminManagerState {
  const _$_AdminManagerState({required this.selectedType});

  @override
  final NavBarItem selectedType;

  @override
  String toString() {
    return 'AdminManagerState(selectedType: $selectedType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdminManagerState &&
            (identical(other.selectedType, selectedType) ||
                other.selectedType == selectedType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdminManagerStateCopyWith<_$_AdminManagerState> get copyWith =>
      __$$_AdminManagerStateCopyWithImpl<_$_AdminManagerState>(
          this, _$identity);
}

abstract class _AdminManagerState implements AdminManagerState {
  const factory _AdminManagerState({required final NavBarItem selectedType}) =
      _$_AdminManagerState;

  @override
  NavBarItem get selectedType;
  @override
  @JsonKey(ignore: true)
  _$$_AdminManagerStateCopyWith<_$_AdminManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}
