// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_crm_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomerCrmState {
  List<CustomerCRM> get customers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerCrmStateCopyWith<CustomerCrmState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCrmStateCopyWith<$Res> {
  factory $CustomerCrmStateCopyWith(
          CustomerCrmState value, $Res Function(CustomerCrmState) then) =
      _$CustomerCrmStateCopyWithImpl<$Res, CustomerCrmState>;
  @useResult
  $Res call({List<CustomerCRM> customers});
}

/// @nodoc
class _$CustomerCrmStateCopyWithImpl<$Res, $Val extends CustomerCrmState>
    implements $CustomerCrmStateCopyWith<$Res> {
  _$CustomerCrmStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customers = null,
  }) {
    return _then(_value.copyWith(
      customers: null == customers
          ? _value.customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<CustomerCRM>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerCrmStateCopyWith<$Res>
    implements $CustomerCrmStateCopyWith<$Res> {
  factory _$$_CustomerCrmStateCopyWith(
          _$_CustomerCrmState value, $Res Function(_$_CustomerCrmState) then) =
      __$$_CustomerCrmStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CustomerCRM> customers});
}

/// @nodoc
class __$$_CustomerCrmStateCopyWithImpl<$Res>
    extends _$CustomerCrmStateCopyWithImpl<$Res, _$_CustomerCrmState>
    implements _$$_CustomerCrmStateCopyWith<$Res> {
  __$$_CustomerCrmStateCopyWithImpl(
      _$_CustomerCrmState _value, $Res Function(_$_CustomerCrmState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customers = null,
  }) {
    return _then(_$_CustomerCrmState(
      customers: null == customers
          ? _value._customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<CustomerCRM>,
    ));
  }
}

/// @nodoc

class _$_CustomerCrmState implements _CustomerCrmState {
  const _$_CustomerCrmState({required final List<CustomerCRM> customers})
      : _customers = customers;

  final List<CustomerCRM> _customers;
  @override
  List<CustomerCRM> get customers {
    if (_customers is EqualUnmodifiableListView) return _customers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customers);
  }

  @override
  String toString() {
    return 'CustomerCrmState(customers: $customers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerCrmState &&
            const DeepCollectionEquality()
                .equals(other._customers, _customers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_customers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerCrmStateCopyWith<_$_CustomerCrmState> get copyWith =>
      __$$_CustomerCrmStateCopyWithImpl<_$_CustomerCrmState>(this, _$identity);
}

abstract class _CustomerCrmState implements CustomerCrmState {
  const factory _CustomerCrmState(
      {required final List<CustomerCRM> customers}) = _$_CustomerCrmState;

  @override
  List<CustomerCRM> get customers;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerCrmStateCopyWith<_$_CustomerCrmState> get copyWith =>
      throw _privateConstructorUsedError;
}
