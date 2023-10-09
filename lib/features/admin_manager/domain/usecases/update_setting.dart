import 'package:dartz/dartz.dart';
import 'package:fotodesk/core/errors/failures.dart';
import 'package:fotodesk/features/admin_manager/domain/repositories/admin_manager_repository.dart';
import 'package:fotodesk/features/authentification/domain/entities/fotodesk_setting.dart';

class UpdateSetting {
  final AdminManagerRepository repository;
  UpdateSetting(this.repository);

  Future<Either<Failure, FotodeskSetting>> execute(
      FotodeskSetting setting) async {
    return await repository.updateSetting(setting);
  }
}
