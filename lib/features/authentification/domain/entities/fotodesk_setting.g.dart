// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fotodesk_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FotodeskSetting _$$_FotodeskSettingFromJson(Map<String, dynamic> json) =>
    _$_FotodeskSetting(
      packages:
          (json['packages'] as List<dynamic>).map((e) => e as String).toList(),
      appSizeInGB: json['appSizeInGB'] as int,
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      trialInMonths: json['trialInMonths'] as int?,
      pricePerMonth: (json['pricePerMonth'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_FotodeskSettingToJson(_$_FotodeskSetting instance) =>
    <String, dynamic>{
      'packages': instance.packages,
      'appSizeInGB': instance.appSizeInGB,
      'id': instance.id,
      'userId': instance.userId,
      'trialInMonths': instance.trialInMonths,
      'pricePerMonth': instance.pricePerMonth,
    };
