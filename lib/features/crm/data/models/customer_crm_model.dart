import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'customer_crm_model.freezed.dart';
part 'customer_crm_model.g.dart';

@freezed
class CustomerCRMModel with _$CustomerCRMModel {
  const factory CustomerCRMModel({
    String? customerId,
    required String firstName,
    String? lastName,
    String? academicTitle,
    String? gender,
    String? companyName,
    String? position,
    String? email,
    String? landline,
    String? phone,
    String? website,
    String? instagram,
    String? facebook,
    String? tiktok,
    String? street,
    String? houseNumber,
    String? postalCode,
    String? city,
    String? state,
    String? country,
    DateTime? birthDate,
    String? lifecyclePosition,
    int? numberOfBookings,
    DateTime? lastAppointment,
    double? totalRevenue,
    int? outstandingInvoices,
    double? customerDiscount,
    bool? newsletterSubscribed,
  }) = _CustomerCRMModel;

  factory CustomerCRMModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerCRMModelFromJson(json);
}
