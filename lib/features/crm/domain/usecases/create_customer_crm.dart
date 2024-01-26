import 'package:dartz/dartz.dart';
import 'package:fotodesk/core/errors/failures.dart';
import 'package:fotodesk/features/crm/domain/entities/customer_crm.dart';
import 'package:fotodesk/features/crm/domain/repositories/customer_crm_repository.dart';

class CreateCustomerCRM {
  final CustomerCRMRepository repository;

  CreateCustomerCRM({required this.repository});

  Future<Either<Failure, void>> execute(CustomerCRM customer) async {
    return await repository.createCustomerCRM(customer);
  }
}
