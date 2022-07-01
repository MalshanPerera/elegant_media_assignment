import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/app_colors.dart';
import '../helpers/app_utils.dart';
import '../helpers/app_strings.dart' show APP_NAME;
import '../view_models/auth_view_model/auth_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    context.read<AuthViewModel>().isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    //Set the screen sizes and the static util variables
    Utils.setScreenSizes(context);

    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Center(
        child: Text(
          APP_NAME,
          style: TextStyle(
            fontSize: Utils.getHeight(22.0),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
