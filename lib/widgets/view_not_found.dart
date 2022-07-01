import 'package:flutter/material.dart';

class ViewNotFound extends StatelessWidget {
  const ViewNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("View Not Found"),
      ),
    );
  }
}
