import 'package:dartz/dartz.dart';
import 'package:fotodesk/features/authentification/domain/entities/user.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/network_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkDataSource networkDataSource;

  AuthRepositoryImpl(this.networkDataSource);

  @override
  Future<Either<Failure, void>> loginUser(String email, String password) async {
    try {
      final user = await networkDataSource.loginUser(email, password);
      return Right(user);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> registerUser(User user) async {
    try {
      final newUser = await networkDataSource.registerUser(user);
      return Right(newUser);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> getUser() async {
    try {
      final newUser = await networkDataSource.getUser();
      return Right(newUser);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
