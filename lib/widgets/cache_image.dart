import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../helpers/app_colors.dart';
import '../helpers/app_strings.dart';
import '../helpers/app_utils.dart';

class CachedImage extends StatelessWidget {
  final double height;
  final double width;
  final String? imageURL;
  final BoxFit boxFit;

  const CachedImage({
    required this.height,
    required this.width,
    this.imageURL,
    this.boxFit = BoxFit.fill,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageUrl: imageURL ?? PLACEHOLDER_IMAGE,
        placeholder: (v, w) => SizedBox(
          height: Utils.getHeight(50.0),
          width: Utils.getHeight(50.0),
          child: const Center(
            child: CircularProgressIndicator(
              backgroundColor: PRIMARY_COLOR,
              color: Colors.white,
            ),
          ),
        ),
        fit: boxFit,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
