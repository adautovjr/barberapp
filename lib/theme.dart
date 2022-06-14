import 'package:flutter/material.dart';

class BespokeTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: Colors.grey[900],
      scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),

      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Colors.red,
      )

    );
  }
}