import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' show FacebookAuth, LoginResult;

import '../../helpers/app_errors.dart' show UnknownFailure;
import '../../helpers/app_strings.dart' show HOME_ROUTE, LOGIN_ROUTE;
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
    // make sure to log out user otherwise it will login using the previous account
    await FirebaseAuth.instance.signOut();

    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.accessToken?.token == null) return;

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      FirebaseAuth.instance.signInWithCredential(facebookAuthCredential).then((loggedInUser) {
        if (loggedInUser.user != null) {
          navigationService.pushReplacement(HOME_ROUTE);
        }
      });
    } on FirebaseAuthException catch (e) {
      errorService.showError(UnknownFailure(
        e.message,
      ));
    }
  }

  @override
  void isLoggedIn() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Future.delayed(const Duration(seconds: 2)).then((_) {
        navigationService.pushReplacement(LOGIN_ROUTE);
      });
    } else {
      Future.delayed(const Duration(seconds: 2)).then((_) {
        navigationService.pushReplacement(HOME_ROUTE);
      });
    }
  }

  @override
  void logout() async {
    await FirebaseAuth.instance.signOut();
    navigationService.pushReplacement(LOGIN_ROUTE);
  }
}
