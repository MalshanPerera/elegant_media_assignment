import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../injection_container.dart';
import '../models/cats_model.dart';

import '../views/views.dart';
import '../view_models/view_models.dart' show HomeViewModel;
import '../widgets/view_not_found.dart';

import 'app_strings.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case INITIAL_ROUTE:
      return MaterialPageRoute(
        builder: (c) => const SplashView(),
      );
    case LOGIN_ROUTE:
      return MaterialPageRoute(
        builder: (c) => const LoginView(),
      );
    case HOME_ROUTE:
      return MaterialPageRoute(
        builder: (c) => ChangeNotifierProvider(
          create: (_) => sl<HomeViewModel>(),
          child: const HomeView(),
        ),
      );
    case DETAILS_ROUTE:
      return MaterialPageRoute(
        builder: (c) => DetailsView(
          data: settings.arguments as Data,
        ),
      );
    case MAP_ROUTE:
      return MaterialPageRoute(
        builder: (c) => MapView(
          data: settings.arguments as Data,
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (c) => const ViewNotFound(),
      );
  }
}
