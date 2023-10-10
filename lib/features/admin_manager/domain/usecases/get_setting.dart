import 'package:dartz/dartz.dart';
import 'package:fotodesk/core/errors/failures.dart';
import 'package:fotodesk/features/admin_manager/domain/repositories/admin_manager_repository.dart';
import 'package:fotodesk/features/authentification/domain/entities/fotodesk_setting.dart';

class GetSettingByUser {
  final AdminManagerRepository repository;
  GetSettingByUser(this.repository);

  Future<Either<Failure, FotodeskSetting>> execute() async {
    return await repository.getSetting();
  }
}
