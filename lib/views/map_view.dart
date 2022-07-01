import 'package:flutter/material.dart';

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map View"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
