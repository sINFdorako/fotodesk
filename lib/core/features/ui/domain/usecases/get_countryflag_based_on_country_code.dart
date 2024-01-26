class GetCountryFlagBasedOnCountryCode {
  final String countryCode;
  final int dialCode;

  GetCountryFlagBasedOnCountryCode(this.countryCode, this.dialCode);

  String get flagUrl => 'https://flagsapi.com/$countryCode/flat/64.png';
}

List<GetCountryFlagBasedOnCountryCode> countries = [
  // eu
  GetCountryFlagBasedOnCountryCode('DE', 49), // Deutschland
  GetCountryFlagBasedOnCountryCode('FR', 33), // Frankreich
  GetCountryFlagBasedOnCountryCode('IT', 39), // Italien
  GetCountryFlagBasedOnCountryCode('ES', 34), // Spanien
  GetCountryFlagBasedOnCountryCode('PL', 48), // Polen
  GetCountryFlagBasedOnCountryCode('RO', 40), // Rumänien
  GetCountryFlagBasedOnCountryCode('NL', 31), // Niederlande
  GetCountryFlagBasedOnCountryCode('BE', 32), // Belgien
  GetCountryFlagBasedOnCountryCode('GR', 30), // Griechenland
  GetCountryFlagBasedOnCountryCode('CZ', 420), // Tschechien
  GetCountryFlagBasedOnCountryCode('PT', 351), // Portugal
  GetCountryFlagBasedOnCountryCode('HU', 36), // Ungarn
  GetCountryFlagBasedOnCountryCode('SE', 46), // Schweden
  GetCountryFlagBasedOnCountryCode('AT', 43), // Österreich
  GetCountryFlagBasedOnCountryCode('BG', 359), // Bulgarien
  GetCountryFlagBasedOnCountryCode('DK', 45), // Dänemark
  GetCountryFlagBasedOnCountryCode('FI', 358), // Finnland
  GetCountryFlagBasedOnCountryCode('SK', 421), // Slowakei
  GetCountryFlagBasedOnCountryCode('IE', 353), // Irland
  GetCountryFlagBasedOnCountryCode('HR', 385), // Kroatien
  GetCountryFlagBasedOnCountryCode('LT', 370), // Litauen
  GetCountryFlagBasedOnCountryCode('SI', 386), // Slowenien
  GetCountryFlagBasedOnCountryCode('LV', 371), // Lettland
  GetCountryFlagBasedOnCountryCode('EE', 372), // Estland
  GetCountryFlagBasedOnCountryCode('CY', 357), // Zypern
  GetCountryFlagBasedOnCountryCode('LU', 352), // Luxemburg
  GetCountryFlagBasedOnCountryCode('MT', 356), // Malta
  // South America
  GetCountryFlagBasedOnCountryCode('AR', 54), // Argentina
  GetCountryFlagBasedOnCountryCode('BR', 55), // Brazil
  GetCountryFlagBasedOnCountryCode('CL', 56), // Chile
  GetCountryFlagBasedOnCountryCode('CO', 57), // Colombia
  GetCountryFlagBasedOnCountryCode('PE', 51), // Peru
  GetCountryFlagBasedOnCountryCode('VE', 58), // Venezuela
  // North America
  GetCountryFlagBasedOnCountryCode('US', 1), // United States
  GetCountryFlagBasedOnCountryCode('CA', 1), // Canada
  GetCountryFlagBasedOnCountryCode('MX', 52), // Mexico
];

String getFlagUrlFromDialCode(int dialCode) {
  if (dialCode != 0) {
    try {
      // Attempt to find the country with the matching dial code
      GetCountryFlagBasedOnCountryCode country = countries.firstWhere(
        (country) => country.dialCode == dialCode,
      );

      // If a country is found, return its flag URL
      return country.flagUrl;
    } catch (e) {
      // Catch the error if no country is found
    }
  }

  // Return an empty string if no country is found or dialCode is 0
  return '';
}
