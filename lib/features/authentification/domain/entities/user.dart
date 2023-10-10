import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum UserRole { user, superadmin }

@freezed
class User with _$User {
  const factory User(
      {required String email,
      String? password,
      String? company,
      String? position,
      DateTime? registered,
      DateTime? lastLogin,
      int? id,
      UserRole? role,
      String? token,
      String? prename,
      String? surname}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
