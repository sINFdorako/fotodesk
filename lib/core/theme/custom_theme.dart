import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    Color primaryColor = const Color(0xFF4D8076);
    Color secondaryColor = const Color.fromARGB(255, 157, 214, 202);

    ColorScheme colorScheme = ColorScheme.fromSeed(
        primary: primaryColor,
        secondary: secondaryColor,
        seedColor: primaryColor,
        brightness: Brightness.light);

    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      primaryColorLight: secondaryColor,
      primaryColorDark: primaryColor,
      scaffoldBackgroundColor: colorScheme.background,
      appBarTheme: AppBarTheme(
        color: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
      ),
      iconTheme: IconThemeData(color: primaryColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: colorScheme.onPrimary,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(color: colorScheme.onBackground),
        displayMedium: TextStyle(color: colorScheme.onBackground),
        displaySmall: TextStyle(color: colorScheme.onBackground),
        headlineMedium: TextStyle(color: colorScheme.onPrimary),
        headlineSmall: TextStyle(color: colorScheme.onBackground),
        titleLarge: TextStyle(color: colorScheme.onBackground),
        bodyLarge: TextStyle(color: colorScheme.onBackground),
        bodyMedium: TextStyle(color: colorScheme.onBackground),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
      useMaterial3: true,
      colorScheme: colorScheme.copyWith(error: Colors.redAccent),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    Color primaryColor = const Color(0xFF4D8076).withOpacity(0.7);
    Color secondaryColor =
        const Color.fromARGB(255, 157, 214, 202).withOpacity(0.7);

    ColorScheme colorScheme = ColorScheme.fromSeed(
      primary: primaryColor,
      secondary: secondaryColor,
      seedColor: primaryColor,
      brightness: Brightness.dark,
    );

    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      primaryColorLight: secondaryColor,
      primaryColorDark: primaryColor,
      scaffoldBackgroundColor: Colors.grey[900],
      appBarTheme: AppBarTheme(
        color: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
      ),
      iconTheme: IconThemeData(color: primaryColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: colorScheme.onPrimary,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(color: colorScheme.onBackground),
        displayMedium: TextStyle(color: colorScheme.onBackground),
        displaySmall: TextStyle(color: colorScheme.onBackground),
        headlineMedium: TextStyle(color: colorScheme.onPrimary),
        headlineSmall: TextStyle(color: colorScheme.onBackground),
        titleLarge: TextStyle(color: colorScheme.onBackground),
        bodyLarge: TextStyle(color: colorScheme.onBackground),
        bodyMedium: TextStyle(color: colorScheme.onBackground),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
      useMaterial3: true,
      colorScheme: colorScheme.copyWith(error: Colors.redAccent),
    );
  }
}
