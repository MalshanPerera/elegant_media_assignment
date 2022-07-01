import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helpers/app_colors.dart';
import 'helpers/app_routes.dart';
import 'helpers/app_strings.dart' show APP_NAME, INITIAL_ROUTE;
import 'injection_container.dart';
import 'services/services.dart' show NavigationService;
import 'view_models/view_models.dart' show AuthViewModel;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sl<AuthViewModel>(),
      child: MaterialApp(
        title: APP_NAME,
        debugShowCheckedModeBanner: false,
        navigatorKey: sl<NavigationService>().navigatorKey,
        theme: ThemeData(
          primaryColor: PRIMARY_COLOR,
          primarySwatch: Colors.blue,
        ),
        initialRoute: INITIAL_ROUTE,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
