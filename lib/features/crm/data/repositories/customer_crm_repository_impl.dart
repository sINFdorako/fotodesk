import 'package:dartz/dartz.dart';
import 'package:fotodesk/core/errors/failures.dart';
import 'package:fotodesk/features/crm/data/datasources/customer_crm_data_source.dart';
import 'package:fotodesk/features/crm/data/mappers/customer_crm_mapper.dart';
import 'package:fotodesk/features/crm/domain/entities/customer_crm.dart';
import 'package:fotodesk/features/crm/domain/repositories/customer_crm_repository.dart';

class CustomerCRMRepositoryImpl implements CustomerCRMRepository {
  final CustomerCRMDataSource dataSource;

  CustomerCRMRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, void>> createCustomerCRM(CustomerCRM customer) async {
    try {
      await dataSource
          .createCustomerCRM(CustomerCRMMapper().customerCRMToModel(customer));
      return const Right(null);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteCustomerCRM(String customerId) {
    // TODO: implement deleteCustomerCRM
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CustomerCRM>>> getCustomerCRM() {
    // TODO: implement getCustomerCRM
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateCustomerCRM(CustomerCRM customer) {
    // TODO: implement updateCustomerCRM
    throw UnimplementedError();
  }
}
