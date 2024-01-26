import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/presentation/cubit/ui_cubit.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/phone_number_input.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_button.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_checkbox_list_tile.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_dialog.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_dropdown.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_text_field.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/date_picker.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/number_input_with_arrows.dart';
import 'package:fotodesk/features/crm/domain/entities/customer_crm.dart';
import 'package:fotodesk/features/crm/presentation/constants/new_customer_dialog_constants.dart';
import 'package:fotodesk/features/crm/presentation/cubit/customer_crm_cubit.dart';

Future<void> addNewCustomer(BuildContext context) async {
  final DatePicker datePicker = DatePicker();
  DateTime? pickedDateBirthday;
  DateTime? pickedDateLastAppointment;

  bool newsletterSubscribed = false;

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var companyNameController = TextEditingController();
  var emailController = TextEditingController();
  var landlineController = TextEditingController();
  var landlineCountryCodeController = TextEditingController(text: '49');
  var landlinePhoneController = TextEditingController();
  var mobilePhoneCountryCodeController = TextEditingController(text: '43');
  var mobilePhoneController = TextEditingController();
  var cityController = TextEditingController();
  var streetController = TextEditingController();
  var houseNumberController = TextEditingController();
  var postalCodeController = TextEditingController();
  var stateController = TextEditingController();
  var countryController = TextEditingController();
  var numberOfBookingsController = TextEditingController();
  var totalRevenueController = TextEditingController();
  var outstandingInvoicesController = TextEditingController();
  var customerDiscountController = TextEditingController();
  var websiteController = TextEditingController();
  var tiktokController = TextEditingController();
  var instagramController = TextEditingController();
  var facebookController = TextEditingController();

  String? selectedGenders;
  String? selectedAcademicDegrees;
  String? selectedPosition;
  String? selectedLifecyclePosition;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        context.read<UiCubit>().updateCountryCodeLandLine(
            int.tryParse(landlineCountryCodeController.text.trim()) ?? 0);
        context.read<UiCubit>().updateCountryCodeMobilePhone(
            int.tryParse(mobilePhoneCountryCodeController.text.trim()) ?? 0);
        return CustomDialog(
          width: 400.w,
          title: const Text('Kunde anlegen'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Persönlich'),
                const Divider(),
                CustomTextField(
                  controller: firstNameController,
                  hintText: 'Vorname',
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: lastNameController,
                  hintText: 'Nachname',
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 8,
                ),
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(minWidth: 200, maxWidth: 500),
                  child: Container(
                    decoration: customDropDownDecoration(context),
                    padding: const EdgeInsets.all(12),
                    child: CustomDropdown<String>(
                      items: NewCustomerDialogConstants.genders
                          .map((String value) {
                        return PopupMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onSelected: (String newValue) {
                        setState(() {
                          selectedGenders = newValue;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(selectedGenders ?? 'Geschlecht wählen',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.7),
                              )),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Text('Geburtstag: '),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomButton(
                        customFillColor: Theme.of(context).colorScheme.surface,
                        onPressed: () async {
                          var birthDate = await datePicker.selectDate(context);
                          setState(() => pickedDateBirthday = birthDate);
                        },
                        label: pickedDateBirthday == null
                            ? 'Datum wählen'
                            : DatePicker()
                                .formatSelectedDate(pickedDateBirthday!),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(minWidth: 200, maxWidth: 500),
                  child: Container(
                    decoration: customDropDownDecoration(context),
                    padding: const EdgeInsets.all(12),
                    child: CustomDropdown<String>(
                      items: NewCustomerDialogConstants.academicDegree
                          .map((String value) {
                        return PopupMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onSelected: (String newValue) {
                        setState(() {
                          selectedAcademicDegrees = newValue;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(selectedAcademicDegrees ?? 'Akademischer Grad'),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Firma'),
                const Divider(),
                CustomTextField(
                  controller: companyNameController,
                  hintText: 'Firmenname',
                  icon: Icons.house,
                ),
                const SizedBox(
                  height: 8,
                ),
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(minWidth: 200, maxWidth: 500),
                  child: Container(
                    decoration: customDropDownDecoration(context),
                    padding: const EdgeInsets.all(12),
                    child: CustomDropdown<String>(
                      items: NewCustomerDialogConstants.positions
                          .map((String value) {
                        return PopupMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onSelected: (String newValue) {
                        setState(() {
                          selectedPosition = newValue;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(selectedPosition ?? 'Position wählen'),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('Kontakt'),
                const Divider(),
                CustomTextField(
                  controller: emailController,
                  hintText: 'Email',
                  icon: Icons.mail,
                ),
                const SizedBox(
                  height: 8,
                ),
                PhoneNumberInput(
                  isMobilePhone: false,
                  hintText: 'Festnetz',
                  controller: landlinePhoneController,
                  iconData: Icons.phone,
                  countryCodeController: landlineCountryCodeController,
                ),
                const SizedBox(
                  height: 8,
                ),
                PhoneNumberInput(
                  isMobilePhone: true,
                  hintText: 'Mobiltelefon',
                  controller: mobilePhoneController,
                  iconData: Icons.phone,
                  countryCodeController: mobilePhoneCountryCodeController,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('Adresse'),
                const Divider(),
                CustomTextField(
                  controller: cityController,
                  hintText: 'Stadt',
                  icon: Icons.location_city,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: streetController,
                  hintText: 'Straße',
                  icon: Icons.location_pin,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: houseNumberController,
                  hintText: 'Hausnummer',
                  icon: Icons.numbers_outlined,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: postalCodeController,
                  hintText: 'Postleitzahl',
                  icon: Icons.numbers,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: stateController,
                  hintText: 'Bundesland',
                  icon: Icons.map,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: countryController,
                  hintText: 'Land',
                  icon: Icons.map_outlined,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('Management'),
                const Divider(),
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(minWidth: 200, maxWidth: 500),
                  child: Container(
                    decoration: customDropDownDecoration(context),
                    padding: const EdgeInsets.all(12),
                    child: CustomDropdown<String>(
                      items: NewCustomerDialogConstants.lifecyclePositions
                          .map((String value) {
                        return PopupMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onSelected: (String newValue) {
                        setState(() {
                          selectedLifecyclePosition = newValue;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(selectedLifecyclePosition ?? 'Zyklus wählen'),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Text('Letzter gemeinsamer Termin: '),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomButton(
                          customFillColor:
                              Theme.of(context).colorScheme.surface,
                          onPressed: () async {
                            var date = await datePicker.selectDate(context);
                            setState(() => pickedDateLastAppointment = date);
                          },
                          label: pickedDateLastAppointment == null
                              ? 'Datum wählen'
                              : DatePicker().formatSelectedDate(
                                  pickedDateLastAppointment!)),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                NumberInputWithArrows(
                  iconData: Icons.book,
                  hintText: 'Anz. bisheriger Buchungen',
                  controller: numberOfBookingsController,
                ),
                const SizedBox(
                  height: 8,
                ),
                NumberInputWithArrows(
                  allowDecimal: true,
                  iconData: Icons.euro,
                  hintText: 'Gesamte Einnahmen',
                  controller: totalRevenueController,
                ),
                const SizedBox(
                  height: 8,
                ),
                NumberInputWithArrows(
                  iconData: Icons.receipt,
                  hintText: 'Offene Rechnungen',
                  controller: outstandingInvoicesController,
                ),
                const SizedBox(
                  height: 8,
                ),
                NumberInputWithArrows(
                  allowDecimal: true,
                  iconData: Icons.percent,
                  hintText: 'Kundenrabatt',
                  controller: customerDiscountController,
                ),
                const SizedBox(
                  height: 8,
                ),
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(minWidth: 200, maxWidth: 500),
                  child: CustomCheckboxListTile(
                      icon: Icons.newspaper,
                      title: 'Newsletter abonniert',
                      value: newsletterSubscribed,
                      onChanged: (bool? newValue) {
                        setState(() {
                          newsletterSubscribed = newValue ?? false;
                        });
                      }),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('Webseite und Socials'),
                const Divider(),
                CustomTextField(
                  controller: websiteController,
                  hintText: 'Webseite',
                  icon: Icons.web,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: tiktokController,
                  hintText: 'TikTok',
                  icon: Icons.tiktok,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: instagramController,
                  hintText: 'Instagram',
                  icon: Icons.camera,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: facebookController,
                  hintText: 'Facebook',
                  icon: Icons.facebook,
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          actions: [
            CustomButton(
              label: 'Abbrechen',
              onPressed: () => Navigator.of(context).pop(),
            ),
            const SizedBox(width: 8),
            CustomButton(
              label: 'Hinzufügen',
              onPressed: () async {
                // Konvertierung von Datum und Zahlen
                final int numberOfBookings =
                    int.tryParse(numberOfBookingsController.text) ?? 0;
                final double totalRevenue =
                    double.tryParse(totalRevenueController.text) ?? 0.0;
                final int outstandingInvoices =
                    int.tryParse(outstandingInvoicesController.text) ?? 0;
                final double customerDiscount =
                    double.tryParse(customerDiscountController.text) ?? 0.0;

                // Erstellen des CustomerCRM Objekts
                var customer = CustomerCRM(
                  firstName: firstNameController.text.trim(),
                  lastName: lastNameController.text.trim(),
                  gender: selectedGenders ?? '',
                  academicTitle: selectedAcademicDegrees ?? '',
                  companyName: companyNameController.text.trim(),
                  position: selectedPosition ?? '',
                  email: emailController.text.trim(),
                  landline: landlineController.text.trim(),
                  phone: mobilePhoneController.text.trim(),
                  website: websiteController.text.trim(),
                  instagram: instagramController.text.trim(),
                  facebook: facebookController.text.trim(),
                  tiktok: tiktokController.text.trim(),
                  street: streetController.text.trim(),
                  houseNumber: houseNumberController.text.trim(),
                  postalCode: postalCodeController.text.trim(),
                  city: cityController.text.trim(),
                  state: stateController.text.trim(),
                  country: countryController.text.trim(),
                  birthDate: pickedDateBirthday,
                  lifecyclePosition: selectedLifecyclePosition ?? '',
                  numberOfBookings: numberOfBookings,
                  lastAppointment: pickedDateLastAppointment,
                  totalRevenue: totalRevenue,
                  outstandingInvoices: outstandingInvoices,
                  customerDiscount: customerDiscount,
                  newsletterSubscribed: newsletterSubscribed,
                );

                await context.read<CustomerCrmCubit>().createCustomer(customer);

                // Show some loading animation

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
    },
  );
}

Decoration customDropDownDecoration(BuildContext context) {
  return BoxDecoration(
      color: Theme.of(context).colorScheme.background,
      border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(.4)),
      borderRadius: BorderRadius.circular(16));
}
