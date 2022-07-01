import 'package:flutter/widgets.dart' show Icon, VoidCallback;

import '../helpers/app_errors.dart';
import '../widgets/error_toast.dart';
import 'navigation_service.dart';

class ErrorService {
  final NavigationService navigationService;

  const ErrorService({required this.navigationService});

  void showError(Failure failure, [Icon? icon, VoidCallback? onRetry]) {
    final context = navigationService.navigatorKey.currentState!.overlay!.context;
    final ErrorToast handler = ErrorToast();
    handler.showError(context, failure.toString(), icon, onRetry);
  }
}
