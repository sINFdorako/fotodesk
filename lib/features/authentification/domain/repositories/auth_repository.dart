import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user.dart'; // Adjust this import path to point to your User class

abstract class AuthRepository {
  Future<Either<Failure, void>> loginUser(String email, String password);
  Future<Either<Failure, User>> registerUser(User user);
  Future<Either<Failure, User>> getUser();
}
