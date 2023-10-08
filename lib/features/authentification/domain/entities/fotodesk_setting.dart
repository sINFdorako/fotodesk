import 'package:freezed_annotation/freezed_annotation.dart';

part 'fotodesk_setting.freezed.dart';
part 'fotodesk_setting.g.dart';

enum FotodeskPackage { crm, gallery, ecommerce, kanban }

@freezed
class FotodeskSetting with _$FotodeskSetting {
  const factory FotodeskSetting({
    required List<FotodeskPackage> packages,
    required int appSizeInGB,
    int? id,
    String? userId,
  }) = _FotodeskSetting;

  factory FotodeskSetting.fromJson(Map<String, dynamic> json) =>
      _$FotodeskSettingFromJson(json);
}
