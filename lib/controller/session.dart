import 'package:flutter/material.dart';

class SessionController extends ChangeNotifier {
  late String _username;
  late String _password;

  void login(String user, String pass) {
    _username = user;
    _password = pass;
    notifyListeners();
  }

  String get username => _username;
}
