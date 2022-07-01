import 'dart:convert';

import 'package:elegant_media_assignment/models/cats_model.dart';
import 'package:flutter/foundation.dart';

import '../../helpers/app_config.dart';
import '../../helpers/app_enum.dart';
import '../../helpers/app_errors.dart';
import '../../services/error_service.dart';
import '../../services/network_service.dart';
import '../clients/home_repository.dart';

class HomeDelegate extends HomeRepository {
  final NetworkService networkService;
  final ErrorService errorService;

  HomeDelegate({required this.networkService, required this.errorService});

  @override
  Future<Cats?> getCats() async {
    try {
      var response = await networkService.performRequest(AppConfig.getCats, HttpAction.GET);

      if (response.statusCode == 200) {
        return await compute(catsFromJson, response.body);
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
