import 'package:flutter/material.dart';

import '../helpers/app_utils.dart';
import '../models/cats_model.dart';
import 'cache_image.dart';

class TileCard extends StatelessWidget {
  final Data cat;

  const TileCard({
    Key? key,
    required this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: CachedImage(
              width: Utils.getHeight(60.0),
              height: Utils.getHeight(60.0),
              imageURL: cat.image.small,
            ),
          ),
          SizedBox(
            width: Utils.getWidth(20.0),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        cat.title,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Utils.getHeight(10.0),
                ),
                Text(
                  cat.address,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
