import 'package:dartz/dartz.dart';
import 'package:fotodesk/core/errors/failures.dart';
import 'package:fotodesk/features/crm/domain/entities/customer_crm.dart';

abstract class CustomerCRMRepository {
  Future<Either<Failure, void>> createCustomerCRM(CustomerCRM customer);
  Future<Either<Failure, void>> updateCustomerCRM(CustomerCRM customer);
  Future<Either<Failure, void>> deleteCustomerCRM(String customerId);
  Future<Either<Failure, List<CustomerCRM>>> getCustomerCRM();
}
