import 'package:dartz/dartz.dart';
import 'package:fotodesk/core/errors/failures.dart';
import 'package:fotodesk/features/authentification/domain/entities/fotodesk_setting.dart';

abstract class AdminManagerRepository {
  Future<Either<Failure, String>> updateApiKey();
  Future<Either<Failure, FotodeskSetting>> getSetting();
  Future<Either<Failure, FotodeskSetting>> createSetting(
      FotodeskSetting setting);
  Future<Either<Failure, FotodeskSetting>> updateSetting(
      FotodeskSetting setting);
  Future<Either<Failure, void>> deleteSetting();
}
