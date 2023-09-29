import 'package:intl/intl.dart';

class TransformDate {
  String getDate(DateTime lastModifiedDate) {
    final datePart = DateFormat('d. MMMM', 'de_DE').format(lastModifiedDate);
    final timePart = DateFormat('HH:mm', 'de_DE').format(lastModifiedDate);

    return '$datePart um $timePart Uhr';
  }
}
