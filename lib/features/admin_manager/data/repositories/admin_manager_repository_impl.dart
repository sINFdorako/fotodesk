import 'package:dartz/dartz.dart';
import 'package:fotodesk/core/errors/failures.dart';
import 'package:fotodesk/features/admin_manager/data/datasources/network_data_source_am.dart';
import 'package:fotodesk/features/admin_manager/domain/repositories/admin_manager_repository.dart';
import 'package:fotodesk/features/authentification/domain/entities/fotodesk_setting.dart';

class AdminManagerRepositoryImpl extends AdminManagerRepository {
  final NetworkDataSourceAM networkDataSourceAM;

  AdminManagerRepositoryImpl(this.networkDataSourceAM);

  @override
  Future<Either<Failure, String>> updateApiKey() async {
    try {
      final String apiKey = await networkDataSourceAM.updateApiKey();
      return Right(apiKey);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, FotodeskSetting>> getSetting() async {
    try {
      final setting = await networkDataSourceAM.getSetting();
      return Right(setting);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, FotodeskSetting>> createSetting(
      FotodeskSetting setting) async {
    try {
      final newSetting = await networkDataSourceAM.createSetting(setting);
      return Right(newSetting);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, FotodeskSetting>> updateSetting(
      FotodeskSetting setting) async {
    try {
      final updatedSetting = await networkDataSourceAM.updateSetting(setting);
      return Right(updatedSetting);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteSetting() async {
    try {
      await networkDataSourceAM.deleteSetting();
      return const Right(null);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
