import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        child: ElevatedButton(
          child: const Text("Login"),
          onPressed: () {
            context.read<AuthViewModel>().facebookLogin();
          },
        ),
      ),
    );
  }
}
