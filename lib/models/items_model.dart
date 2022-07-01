import 'dart:convert';

import '../helpers/app_strings.dart';

Items itemsFromJson(String str) => Items.fromJson(json.decode(str));

class Items {
  final int status;
  final List<Data> data;

  Items({
    required this.status,
    required this.data,
  });

  factory Items.empty() => Items(
        status: 0,
        data: [],
      );

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        status: json["status"] ?? 0,
        data: List<Data>.from(
          json["data"] == null ? [] : json["data"].map((x) => Data.fromJson(x)),
        ),
      );
}

class Data {
  final int id;
  final String title;
  final String description;
  final String address;
  final String postcode;
  final String phoneNumber;
  final String latitude;
  final String longitude;
  final Image image;

  Data({
    required this.id,
    required this.title,
    required this.description,
    required this.address,
    required this.postcode,
    required this.phoneNumber,
    required this.latitude,
    required this.longitude,
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        address: json["address"] ?? "",
        postcode: json["postcode"] ?? "",
        phoneNumber: json["phoneNumber"] ?? "",
        latitude: json["latitude"] ?? "",
        longitude: json["longitude"] ?? "",
        image: Image.fromJson(json["image"] ?? {}),
      );
}

class Image {
  final String small;
  final String medium;
  final String large;

  Image({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        small: json["small"] ?? PLACEHOLDER_IMAGE,
        medium: json["medium"] ?? PLACEHOLDER_IMAGE,
        large: json["large"] ?? PLACEHOLDER_IMAGE,
      );
}
