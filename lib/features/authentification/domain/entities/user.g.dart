// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      email: json['email'] as String,
      password: json['password'] as String?,
      company: json['company'] as String?,
      position: json['position'] as String?,
      registered: json['registered'] == null
          ? null
          : DateTime.parse(json['registered'] as String),
      lastLogin: json['lastLogin'] == null
          ? null
          : DateTime.parse(json['lastLogin'] as String),
      id: json['id'] as int?,
      role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'company': instance.company,
      'position': instance.position,
      'registered': instance.registered?.toIso8601String(),
      'lastLogin': instance.lastLogin?.toIso8601String(),
      'id': instance.id,
      'role': _$UserRoleEnumMap[instance.role],
      'token': instance.token,
    };

const _$UserRoleEnumMap = {
  UserRole.user: 'user',
  UserRole.superadmin: 'superadmin',
};
