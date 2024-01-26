import 'package:bloc/bloc.dart';
import 'package:fotodesk/features/crm/domain/entities/customer_crm.dart';
import 'package:fotodesk/features/crm/domain/repositories/customer_crm_repository.dart';
import 'package:fotodesk/features/crm/domain/usecases/create_customer_crm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_crm_state.dart';
part 'customer_crm_cubit.freezed.dart';

class CustomerCrmCubit extends Cubit<CustomerCrmState> {
  final CustomerCRMRepository customerCRMRepository;

  CustomerCrmCubit(this.customerCRMRepository)
      : super(CustomerCrmState.initial());

  Future<void> createCustomer(CustomerCRM customer) async {
    await CreateCustomerCRM(repository: customerCRMRepository)
        .execute(customer);
  }
}
