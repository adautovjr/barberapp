import 'package:flutter/material.dart';

class TokenController extends ChangeNotifier {
  late String _token;

  String get token => _token;

  set token(String value) {
    _token = value;
    notifyListeners();
  }
}