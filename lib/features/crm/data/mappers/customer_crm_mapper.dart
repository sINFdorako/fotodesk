import 'package:fotodesk/features/crm/data/models/customer_crm_model.dart';
import 'package:fotodesk/features/crm/domain/entities/customer_crm.dart';

class CustomerCRMMapper {
  CustomerCRMModel customerCRMToModel(CustomerCRM customer) {
    return CustomerCRMModel(
      customerId: customer.customerId,
      firstName: customer.firstName,
      lastName: customer.lastName,
      academicTitle: customer.academicTitle,
      gender: customer.gender,
      companyName: customer.companyName,
      position: customer.position,
      email: customer.email,
      landline: customer.landline,
      phone: customer.phone,
      website: customer.website,
      instagram: customer.instagram,
      facebook: customer.facebook,
      tiktok: customer.tiktok,
      street: customer.street,
      houseNumber: customer.houseNumber,
      postalCode: customer.postalCode,
      city: customer.city,
      state: customer.state,
      country: customer.country,
      birthDate: customer.birthDate,
      lifecyclePosition: customer.lifecyclePosition,
      numberOfBookings: customer.numberOfBookings,
      lastAppointment: customer.lastAppointment,
      totalRevenue: customer.totalRevenue,
      outstandingInvoices: customer.outstandingInvoices,
      customerDiscount: customer.customerDiscount,
      newsletterSubscribed: customer.newsletterSubscribed,
    );
  }

  CustomerCRM customerModelToCRM(CustomerCRMModel model) {
    return CustomerCRM(
      customerId: model.customerId ?? '',
      firstName: model.firstName,
      lastName: model.lastName ?? '',
      academicTitle: model.academicTitle ?? '',
      gender: model.gender ?? '',
      companyName: model.companyName ?? '',
      position: model.position ?? '',
      email: model.email ?? '',
      landline: model.landline ?? '',
      phone: model.phone ?? '',
      website: model.website ?? '',
      instagram: model.instagram ?? '',
      facebook: model.facebook ?? '',
      tiktok: model.tiktok ?? '',
      street: model.street ?? '',
      houseNumber: model.houseNumber ?? '',
      postalCode: model.postalCode ?? '',
      city: model.city ?? '',
      state: model.state ?? '',
      country: model.country ?? '',
      birthDate: model.birthDate,
      lifecyclePosition: model.lifecyclePosition ?? '',
      numberOfBookings: model.numberOfBookings ?? 0,
      lastAppointment: model.lastAppointment,
      totalRevenue: model.totalRevenue ?? 0.0,
      outstandingInvoices: model.outstandingInvoices ?? 0,
      customerDiscount: model.customerDiscount ?? 0.0,
      newsletterSubscribed: model.newsletterSubscribed ?? false,
    );
  }
}
