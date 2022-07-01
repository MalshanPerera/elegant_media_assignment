import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/app_colors.dart';
import '../helpers/app_utils.dart';
import '../view_models/auth_view_model/auth_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login View"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: SizedBox(
          width: Utils.getWidth(200.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              primary: PRIMARY_COLOR.withOpacity(0.8),
            ),
            onPressed: () {
              context.read<AuthViewModel>().facebookLogin();
            },
            child: const Text("Login"),
          ),
        ),
      ),
    );
  }
}
