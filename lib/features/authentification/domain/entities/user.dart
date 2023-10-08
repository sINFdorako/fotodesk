import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum UserRole { user, superadmin }

@freezed
class User with _$User {
  const factory User({
    required String email,
    String? password,
    int? id,
    UserRole? role,
    String? token,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
