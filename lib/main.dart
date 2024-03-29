import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/global_font_size.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/screen_size.dart';
import 'package:fotodesk/core/theme/custom_theme.dart';
import 'package:fotodesk/features/admin_manager/data/datasources/network_data_source_am.dart';
import 'package:fotodesk/features/admin_manager/data/repositories/admin_manager_repository_impl.dart';
import 'package:fotodesk/features/admin_manager/presentation/cubit/admin_manager_cubit.dart';
import 'package:fotodesk/features/authentification/data/datasources/network_data_source.dart';
import 'package:fotodesk/features/authentification/data/repositories/auth_repository_impl.dart';
import 'package:fotodesk/features/authentification/presentation/cubit/auth_cubit.dart';
import 'package:fotodesk/features/gallery_administration/data/datasources/network_data_source_ga.dart';
import 'package:fotodesk/features/gallery_administration/data/repositories/gallery_admin_repository_impl.dart';
import 'package:timezone/data/latest_10y.dart';
import 'package:timezone/timezone.dart';

import 'core/di/injector.dart';
import 'core/router/router.gr.dart';
import 'features/gallery_administration/presentation/cubit/gallery_admin_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupLocator();

  initializeTimeZones();
  var berlin = getLocation('Europe/Berlin');
  setLocalLocation(berlin);

  //GalleryAdmin init
  final networkDataSourceAuth = NetworkDataSource();
  final networkDataSourceGA = NetworkDataSourceGA();
  final networkDataSourceAM = NetworkDataSourceAM();
  final galleryAdminRepository =
      GalleryAdminRepositoryImpl(networkDataSourceGA);
  final adminManagerRepository =
      AdminManagerRepositoryImpl(networkDataSourceAM);
  final authRepository = AuthRepositoryImpl(networkDataSourceAuth);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('de')],
      path: 'assets/localization',
      fallbackLocale: const Locale('en'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(authRepository),
          ),
          BlocProvider(
            create: (context) => AdminManagerCubit(adminManagerRepository),
          ),
          BlocProvider(
            create: (context) => GalleryAdminCubit(galleryAdminRepository),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(1280, 800),
          builder: (_, __) => ScreenSize.isMobile(_)
              ? const UnsupportedScreenSize()
              : const Fotodesk(),
        ),
      ),
    ),
  );
}

class UnsupportedScreenSize extends StatelessWidget {
  const UnsupportedScreenSize({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            "Die App ist derzeit nicht für Handys oder Tablets optimiert, bitte wechsle zu einem Computer oder vergrößere das Browserfenster.",
            style: TextStyle(fontSize: FontUtil.h2),
          ),
        ),
      ),
    );
  }
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
