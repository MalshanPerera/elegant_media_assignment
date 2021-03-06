import 'package:get_it/get_it.dart';

import 'repositories/repositories.dart';
import 'services/services.dart';
import 'view_models/view_models.dart';

/*
  All the services and repositories that are used in the app should be registered here.
  Registering in the GetIt container means that they will be instantiated once,
  and shared between all the widgets in the app.
*/
final sl = GetIt.instance;

void init() {
  /// Register all the view models
  sl.registerFactory<AuthViewModel>(
    () => IAuthViewModel(
      navigationService: sl(),
      errorService: sl(),
    ),
  );

  sl.registerFactory<HomeViewModel>(
    () => IHomeViewModel(
      homeRepository: sl(),
      navigationService: sl(),
      errorService: sl(),
    ),
  );

  /// Register all the repositories
  sl.registerLazySingleton<HomeRepository>(
    () => HomeDelegate(
      networkService: sl(),
      errorService: sl(),
    ),
  );

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
