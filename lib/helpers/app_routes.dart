import 'package:flutter/material.dart' show MaterialPageRoute, Route, RouteSettings;

import '../views/details_view.dart';
import '../views/home_view.dart';
import '../views/login_view.dart';
import '../views/map_view.dart';
import '../views/splash_view.dart';
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
        builder: (c) => const HomeView(),
      );
    case DETAILS_ROUTE:
      return MaterialPageRoute(
        builder: (c) => const DetailsView(),
      );
    case MAP_ROUTE:
      return MaterialPageRoute(
        builder: (c) => const MapView(),
      );
    default:
      return MaterialPageRoute(
        builder: (c) => const ViewNotFound(),
      );
  }
}
