import 'package:dartz/dartz.dart';
import 'package:fotodesk/features/authentification/domain/repositories/auth_repository.dart';

import '../../../../core/errors/failures.dart';

class RegisterUser {
  final AuthRepository authRepository;

  RegisterUser(this.authRepository);

  Future<Either<Failure, void>> execute(String email, String password) {
    return authRepository.registerUser(email, password);
  }
}
