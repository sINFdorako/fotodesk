part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required bool isLight,
    required User? user,
  }) = _AuthState;

  factory AuthState.initial() {
    return const AuthState(isLight: true, user: null);
  }
}
