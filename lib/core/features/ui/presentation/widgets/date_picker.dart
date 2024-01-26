import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker {
  DateTime selectedDate = DateTime.now();

  // Funktion, um das Datum auszuwählen
  Future<DateTime> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900, 1),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).colorScheme.primary, // Hauptfarbe
              onPrimary: Theme.of(context)
                  .colorScheme
                  .onPrimary, // Farbe für Text und Icons
              onSurface: Theme.of(context)
                  .colorScheme
                  .onSurface, // Farbe für inaktive Elemente
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, // Farbe für Text auf Buttons
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }

    return selectedDate;
  }

  // Funktion, um das Datum zu formatieren
  String formatSelectedDate(DateTime selectedDate) {
    return DateFormat('dd.MM.yyyy').format(selectedDate);
  }
}
