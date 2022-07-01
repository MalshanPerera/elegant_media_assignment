import 'package:get_it/get_it.dart';

import 'services/error_service.dart';
import 'services/navigation_service.dart';
import 'services/network_service.dart';
import 'view_models/auth_view_model/auth_view_model.dart';
import 'view_models/auth_view_model/i_auth_view_model.dart';

final sl = GetIt.instance;

void init() {
  /// Register all the view models
  sl.registerFactory<AuthViewModel>(
    () => IAuthViewModel(
      navigationService: sl(),
      errorService: sl(),
    ),
  );

  /// Register all the repositories
  // sl.registerLazySingleton<HomeRepository>(
  //   () => HomeDelegate(
  //     networkService: sl(),
  //     errorService: sl(),
  //   ),
  // );

  /// Register all the services
  sl.registerLazySingleton<NavigationService>(
    () => NavigationService(),
  );
  sl.registerLazySingleton<ErrorService>(
    () => ErrorService(
      navigationService: sl(),
    ),
  );
  sl.registerLazySingleton<NetworkService>(
    () => NetworkService(
      errorService: sl(),
    ),
    dispose: (c) => c.dispose(),
  );
}
