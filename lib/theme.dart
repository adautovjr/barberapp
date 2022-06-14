import 'package:flutter/material.dart';

class BespokeTheme {
  static ThemeData get theme {
    return ThemeData(
        primaryColor: Color.fromARGB(224, 249, 195, 189),
        // scaffoldBackgroundColor: Colors.teal,
        backgroundColor: Color.fromRGBO(12, 12, 12, 100),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.red,
        ));
  }
}
