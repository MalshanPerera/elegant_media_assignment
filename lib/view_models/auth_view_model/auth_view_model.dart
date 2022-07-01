import 'package:flutter/foundation.dart' show ChangeNotifier;

abstract class AuthViewModel extends ChangeNotifier {
  void facebookLogin();

  void isLoggedIn();

  void logout();
}
