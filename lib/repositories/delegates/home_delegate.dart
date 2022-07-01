import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../helpers/app_config.dart';
import '../../helpers/app_enum.dart';
import '../../helpers/app_errors.dart';
import '../../models/items_model.dart';
import '../../services/services.dart' show ErrorService, NetworkService;
import '../clients/home_repository.dart';

class HomeDelegate extends HomeRepository {
  final NetworkService networkService;
  final ErrorService errorService;

  HomeDelegate({required this.networkService, required this.errorService});

  @override
  Future<Items?> getItems() async {
    try {
      var response = await networkService.performRequest(AppConfig.getItems, HttpAction.GET);

      if (response.statusCode == 200) {
        return await compute(itemsFromJson, response.body);
      } else {
        errorService.showError(
          UnknownFailure(
            jsonDecode(response.body),
          ),
        );
        return null;
      }
    } catch (e) {
      errorService.showError(
        UnknownFailure(
          e.toString(),
        ),
      );
      return null;
    }
  }
}
