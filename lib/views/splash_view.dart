import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/app_utils.dart';
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

    return const Scaffold(
      body: Center(
        child: Text(
          'Cat Hub',
        ),
      ),
    );
  }
}
