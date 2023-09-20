import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fotodesk/core/theme/custom_theme.dart';
import 'package:fotodesk/features/authentification/presentation/cubit/auth_cubit.dart';

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
    child: BlocProvider(
      create: (context) => AuthCubit(),
      child: const Fotodesk(),
    ),
  ));
}

class Fotodesk extends StatelessWidget {
  const Fotodesk({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();
    final authCubit = context.watch<AuthCubit>().state;

    return MaterialApp.router(
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Fotodesk',
        theme:
            authCubit.isLight ? CustomTheme.lightTheme : CustomTheme.darkTheme);
  }
}
