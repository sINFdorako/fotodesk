import 'package:dartz/dartz.dart';
import 'package:fotodesk/core/errors/failures.dart';
import 'package:fotodesk/features/admin_manager/data/datasources/network_data_source_am.dart';
import 'package:fotodesk/features/admin_manager/domain/repositories/admin_manager_repository.dart';

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
}
