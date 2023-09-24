import 'package:dartz/dartz.dart';

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
  Future<Either<Failure, void>> registerUser(
      String email, String password) async {
    try {
      final user = await networkDataSource.registerUser(email, password);
      return Right(user);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
