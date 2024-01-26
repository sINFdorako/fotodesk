// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_crm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerCRMModel _$$_CustomerCRMModelFromJson(Map<String, dynamic> json) =>
    _$_CustomerCRMModel(
      customerId: json['customerId'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String?,
      academicTitle: json['academicTitle'] as String?,
      gender: json['gender'] as String?,
      companyName: json['companyName'] as String?,
      position: json['position'] as String?,
      email: json['email'] as String?,
      landline: json['landline'] as String?,
      phone: json['phone'] as String?,
      website: json['website'] as String?,
      instagram: json['instagram'] as String?,
      facebook: json['facebook'] as String?,
      tiktok: json['tiktok'] as String?,
      street: json['street'] as String?,
      houseNumber: json['houseNumber'] as String?,
      postalCode: json['postalCode'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      lifecyclePosition: json['lifecyclePosition'] as String?,
      numberOfBookings: json['numberOfBookings'] as int?,
      lastAppointment: json['lastAppointment'] == null
          ? null
          : DateTime.parse(json['lastAppointment'] as String),
      totalRevenue: (json['totalRevenue'] as num?)?.toDouble(),
      outstandingInvoices: json['outstandingInvoices'] as int?,
      customerDiscount: (json['customerDiscount'] as num?)?.toDouble(),
      newsletterSubscribed: json['newsletterSubscribed'] as bool?,
    );

Map<String, dynamic> _$$_CustomerCRMModelToJson(_$_CustomerCRMModel instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'academicTitle': instance.academicTitle,
      'gender': instance.gender,
      'companyName': instance.companyName,
      'position': instance.position,
      'email': instance.email,
      'landline': instance.landline,
      'phone': instance.phone,
      'website': instance.website,
      'instagram': instance.instagram,
      'facebook': instance.facebook,
      'tiktok': instance.tiktok,
      'street': instance.street,
      'houseNumber': instance.houseNumber,
      'postalCode': instance.postalCode,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'birthDate': instance.birthDate?.toIso8601String(),
      'lifecyclePosition': instance.lifecyclePosition,
      'numberOfBookings': instance.numberOfBookings,
      'lastAppointment': instance.lastAppointment?.toIso8601String(),
      'totalRevenue': instance.totalRevenue,
      'outstandingInvoices': instance.outstandingInvoices,
      'customerDiscount': instance.customerDiscount,
      'newsletterSubscribed': instance.newsletterSubscribed,
    };
