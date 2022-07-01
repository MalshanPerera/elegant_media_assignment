import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';

import '../helpers/app_enum.dart';
import '../helpers/app_errors.dart';
import 'error_service.dart';

class NetworkService {
  late Client _client;

  final Map<String, String> _headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  final ErrorService errorService;

  NetworkService({required this.errorService});

  Future<Response> performRequest(
    String url,
    HttpAction action, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      _client = Client();
      late Response response;

      switch (action) {
        case HttpAction.GET:
          response = await _client.get(Uri.parse(url), headers: _headers);
          break;
      }

      log("Network Call: $url");
      log("StatusCode: ${response.statusCode} Result: ${response.body}");

      return response;
    } on SocketException {
      errorService.showError(NetworkFailure());
      return Future.error(NetworkFailure());
    } on TimeoutException {
      errorService.showError(TimeoutFailure());
      return Future.error(TimeoutFailure());
    } on FormatException {
      errorService.showError(FormatFailure());
      return Future.error(FormatFailure());
    } on HttpException {
      errorService.showError(HttpFailure());
      return Future.error(HttpFailure());
    }
  }

  void dispose() {
    _client.close();
  }
}
