import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@JsonSerializable()
class User with _$User {
  const factory User({required String email}) = _User;

  // This factory constructor is used to create a new User instance from a JSON map.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
