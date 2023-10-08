import 'package:auto_route/auto_route.dart';
import 'package:fotodesk/core/router/router.gr.dart';
import 'package:fotodesk/features/authentification/data/datasources/local_data_source.dart';

class AuthGuard implements AutoRouteGuard {
  Future<bool> canNavigate(
      List<PageRouteInfo> pendingRoutes, StackRouter router) async {
    // Fetch the token or check its validity
    final user = await LocalDataSource().getUser();

    // If there's no token or it's invalid, navigate to login page and return false
    if (user!.token == null) {
      router.replace(const LoginRoute());
      return false;
    }
    return true;
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    resolver.next(true);
  }
}
