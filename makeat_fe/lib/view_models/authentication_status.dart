import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners();
    print(isLoggedIn);
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
    print(isLoggedIn);
  }
}