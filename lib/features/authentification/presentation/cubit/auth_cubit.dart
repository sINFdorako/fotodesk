import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fotodesk/core/errors/failures.dart';
import 'package:fotodesk/features/authentification/domain/entities/user.dart';
import 'package:fotodesk/features/authentification/domain/repositories/auth_repository.dart';
import 'package:fotodesk/features/authentification/domain/usecases/get_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  AuthCubit(this.authRepository) : super(AuthState.initial());

  toggleTheme() {
    emit(state.copyWith(isLight: !state.isLight));
  }

  Future<void> updateUserState() async {
    final Either<Failure, User> user = await GetUser(authRepository).execute();

    user.fold((failure) {
      //handle failure
    }, (user) {
      emit(state.copyWith(user: user));
    });
  }
}
