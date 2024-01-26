class CustomerCRM {
  String gender;
  String academicTitle;
  String customerId;
  String firstName;
  String lastName;
  String companyName; // Firmenname
  String position; // Position im Unternehmen
  String email;
  String landline; // Festnetz
  String phone;
  String website;
  String instagram;
  String facebook;
  String tiktok;
  String street;
  String houseNumber;
  String postalCode; // Postleitzahl
  String city;
  String state; // Bundesland
  String country;
  DateTime? birthDate; // Geburtsdatum
  String lifecyclePosition;
  int numberOfBookings; // Anz. Buchungen
  DateTime? lastAppointment; // Letzter Termin
  double totalRevenue; // Gesamt Einnahmen
  int outstandingInvoices; // Off. Rechnungen
  double customerDiscount; // Kundenrabatt
  bool newsletterSubscribed; // Newsletter

  CustomerCRM({
    this.customerId = '',
    required this.firstName,
    this.lastName = '',
    this.academicTitle = '',
    this.gender = '',
    this.companyName = '',
    this.position = '',
    this.email = '',
    this.landline = '',
    this.phone = '',
    this.website = '',
    this.instagram = '',
    this.facebook = '',
    this.tiktok = '',
    this.street = '',
    this.houseNumber = '',
    this.postalCode = '',
    this.city = '',
    this.state = '',
    this.country = '',
    this.birthDate,
    this.lifecyclePosition = '',
    this.numberOfBookings = 0,
    this.lastAppointment,
    this.totalRevenue = 0.0,
    this.outstandingInvoices = 0,
    this.customerDiscount = 0.0,
    this.newsletterSubscribed = false,
  });
}
