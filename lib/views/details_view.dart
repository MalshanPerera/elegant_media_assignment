import 'package:flutter/material.dart';

import '../helpers/app_strings.dart';
import '../helpers/app_utils.dart';
import '../models/hotels_model.dart';
import '../widgets/cache_image.dart';

class DetailsView extends StatelessWidget {
  final Data data;

  const DetailsView({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details View"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () => Navigator.pushNamed(
              context,
              MAP_ROUTE,
              arguments: data,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: Utils.getHeight(25.0),
            left: Utils.getWidth(20.0),
            right: Utils.getWidth(20.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Utils.getHeight(20.0),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: CachedImage(
                  width: Utils.bodyWidth,
                  height: Utils.getHeight(250.0),
                  imageURL: data.image.large,
                ),
              ),
              SizedBox(
                height: Utils.getHeight(20.0),
              ),
              Text(
                data.title,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Utils.getHeight(25.0),
              ),
              SizedBox(
                height: Utils.getHeight(10.0),
              ),
              Text(
                data.description,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
