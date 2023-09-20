import 'package:auto_route/auto_route.dart';
import 'package:fotodesk/features/admin_manager/presentation/pages/admin_manager_page.dart';
import 'package:fotodesk/features/authentification/presentation/pages/login_page.dart';

@CustomAutoRouter(
  transitionsBuilder: TransitionsBuilders.fadeIn,
  replaceInRouteName: "Page,Route",
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage, path: "/login"),
    AutoRoute(page: AdminManagerPage, path: "/admin-manager", initial: true),
  ],
)
class $AppRouter {}
