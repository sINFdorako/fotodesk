// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fotodesk_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FotodeskSetting _$$_FotodeskSettingFromJson(Map<String, dynamic> json) =>
    _$_FotodeskSetting(
      packages: (json['packages'] as List<dynamic>)
          .map((e) => $enumDecode(_$FotodeskPackageEnumMap, e))
          .toList(),
      appSizeInGB: json['appSizeInGB'] as int,
      id: json['id'] as int?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$_FotodeskSettingToJson(_$_FotodeskSetting instance) =>
    <String, dynamic>{
      'packages':
          instance.packages.map((e) => _$FotodeskPackageEnumMap[e]!).toList(),
      'appSizeInGB': instance.appSizeInGB,
      'id': instance.id,
      'userId': instance.userId,
    };

const _$FotodeskPackageEnumMap = {
  FotodeskPackage.crm: 'crm',
  FotodeskPackage.gallery: 'gallery',
  FotodeskPackage.ecommerce: 'ecommerce',
  FotodeskPackage.kanban: 'kanban',
};
