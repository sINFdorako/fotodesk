import 'package:freezed_annotation/freezed_annotation.dart';

part 'fotodesk_setting.freezed.dart';
part 'fotodesk_setting.g.dart';

@freezed
class FotodeskSetting with _$FotodeskSetting {
  const factory FotodeskSetting({
    required List<String> packages,
    required int appSizeInGB,
    int? id,
    String? userId,
  }) = _FotodeskSetting;

  factory FotodeskSetting.fromJson(Map<String, dynamic> json) =>
      _$FotodeskSettingFromJson(json);
}
