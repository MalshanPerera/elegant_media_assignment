import 'package:flutter/material.dart';

import '../helpers/app_strings.dart';
import '../helpers/app_utils.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2)).then((_) {
      Navigator.pushReplacementNamed(context, LOGIN_ROUTE);
    });
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
