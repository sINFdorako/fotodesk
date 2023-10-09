import 'package:dartz/dartz.dart';
import 'package:fotodesk/core/errors/failures.dart';
import 'package:fotodesk/features/admin_manager/domain/repositories/admin_manager_repository.dart';
import 'package:fotodesk/features/authentification/domain/entities/fotodesk_setting.dart';

class CreateSetting {
  final AdminManagerRepository repository;
  CreateSetting(this.repository);

  Future<Either<Failure, FotodeskSetting>> execute(
      FotodeskSetting setting) async {
    return await repository.createSetting(setting);
  }
}
