import 'package:dartz/dartz.dart';
import 'package:fotodesk/core/errors/failures.dart';

abstract class AdminManagerRepository {
  Future<Either<Failure, String>> updateApiKey();
}
