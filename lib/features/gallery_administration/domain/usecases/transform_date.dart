import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart';

class TransformDate {
  String getDate(DateTime utcDate) {
    final berlinLocation = getLocation('Europe/Berlin');

    // Convert the UTC DateTime to a TZDateTime in the Berlin timezone
    final berlinDate = TZDateTime.from(utcDate, berlinLocation);

    final datePart = DateFormat('d. MMMM', 'de_DE').format(berlinDate);
    final timePart = DateFormat('HH:mm', 'de_DE').format(berlinDate);

    return '$datePart um $timePart Uhr';
  }
}
