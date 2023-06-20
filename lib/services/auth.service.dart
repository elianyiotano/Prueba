import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  bool _authenticated = false;
  String _token_auth = "";
  bool get authenticated => _authenticated;
  String get token_auth => _token_auth;
  String _email = '';

  set email(String email) {
    _email = email;
  }

  String get email => _email;

  set authenticated(
    bool value,
  ) {
    _authenticated = value;
    notifyListeners();
  }

  set token_auth(
    String value,
  ) {
    _token_auth = value;
    notifyListeners();
  }
}
