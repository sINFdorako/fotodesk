part of 'customer_crm_cubit.dart';

@freezed
class CustomerCrmState with _$CustomerCrmState {
  const factory CustomerCrmState({required final List<CustomerCRM> customers}) =
      _CustomerCrmState;

  factory CustomerCrmState.initial() {
    return const CustomerCrmState(customers: []);
  }
}
