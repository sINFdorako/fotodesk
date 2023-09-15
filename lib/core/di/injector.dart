import 'package:fotodesk/features/authentification/data/datasources/network_data_source.dart';
import 'package:get_it/get_it.dart';

import '../../features/authentification/data/repositories/auth_repository_impl.dart';
import '../../features/authentification/domain/repositories/auth_repository.dart';
import '../../features/authentification/domain/usecases/login_user.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<NetworkDataSource>(() => NetworkDataSource());
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt<NetworkDataSource>()));
  getIt.registerLazySingleton<LoginUser>(
      () => LoginUser(getIt<AuthRepository>()));
}
