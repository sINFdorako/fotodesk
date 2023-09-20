import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'core/di/injector.dart';
import 'core/router/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupLocator();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('de')],
    path: 'assets/localization',
    fallbackLocale: const Locale('en'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return MaterialApp.router(
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Fotodesk',
        theme: buildTheme()
        // Color(0xFFC4FCEF), Color(0xFF4D8076)
        );
  }

  ThemeData buildTheme() {
    Color primaryColor = const Color(0xFF4D8076);
    Color secondaryColor = const Color.fromARGB(255, 157, 214, 202);

    ColorScheme colorScheme = ColorScheme.fromSeed(
      primary: primaryColor,
      secondary: secondaryColor,
      seedColor: primaryColor,
    );

    return ThemeData(
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
        headlineMedium: TextStyle(color: colorScheme.onBackground),
        headlineSmall: TextStyle(color: colorScheme.onBackground),
        titleLarge: TextStyle(color: colorScheme.onPrimary),
        titleMedium: TextStyle(color: colorScheme.onBackground),
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
      useMaterial3: true,
      colorScheme: colorScheme.copyWith(error: Colors.redAccent),
    );
  }
}
