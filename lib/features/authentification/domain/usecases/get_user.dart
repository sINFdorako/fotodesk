import 'package:dartz/dartz.dart';
import 'package:fotodesk/features/authentification/domain/entities/user.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/auth_repository.dart';

class GetUser {
  final AuthRepository repository;

  GetUser(this.repository);

  Future<Either<Failure, User>> execute() {
    return repository.getUser();
  }
}
