import 'package:dartz/dartz.dart';
import 'package:fotodesk/core/errors/failures.dart';
import 'package:fotodesk/features/admin_manager/domain/repositories/admin_manager_repository.dart';

class DeleteSetting {
  final AdminManagerRepository repository;
  DeleteSetting(this.repository);

  Future<Either<Failure, void>> execute() async {
    return await repository.deleteSetting();
  }
}
