import 'package:dartz/dartz.dart';
import 'package:fotodesk/core/errors/failures.dart';
import 'package:fotodesk/features/admin_manager/domain/repositories/admin_manager_repository.dart';

class UpdateApiKey {
  final AdminManagerRepository repository;
  UpdateApiKey(this.repository);

  Future<Either<Failure, String>> execute() async {
    return await repository.updateApiKey();
  }
}
