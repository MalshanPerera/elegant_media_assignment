import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../helpers/app_errors.dart';
import '../../services/error_service.dart';
import '../../services/navigation_service.dart';
import 'auth_view_model.dart';

class IAuthViewModel extends AuthViewModel {
  final NavigationService navigationService;
  final ErrorService errorService;

  IAuthViewModel({
    required this.navigationService,
    required this.errorService,
  });

  @override
  void facebookLogin() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.accessToken?.token == null) return;

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      final loggedInUser = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      print(loggedInUser.user);
    } on FirebaseAuthException catch (e) {
      errorService.showError(UnknownFailure(
        e.message,
      ));
    }
  }

  @override
  void isLoggedIn() {
    // String? bearerToken = await SecureStorage.readValue("basicAuth");
    // if (bearerToken != null) {
    //   checkStep();
    // } else {
    //   Future.delayed(const Duration(seconds: 2)).then((_) {
    //     navigationService.pushReplacement('/login');
    //   });
    // }
  }

  @override
  void logout() {
    // TODO: implement logout
  }
}
