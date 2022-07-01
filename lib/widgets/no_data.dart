import 'package:flutter/material.dart';

import '../helpers/app_utils.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search_off_rounded,
            size: 50.0,
          ),
          SizedBox(
            height: Utils.getHeight(15.0),
          ),
          Text(
            "No Search Results",
            style: Theme.of(context).primaryTextTheme.headline1!.copyWith(
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
