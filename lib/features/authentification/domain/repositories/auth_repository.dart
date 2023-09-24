import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> loginUser(String email, String password);
  Future<Either<Failure, void>> registerUser(String email, String password);
}
