import 'package:flutter/material.dart';
import 'package:barber_flutter/routes.dart';
import 'package:barber_flutter/theme.dart';

Widget materialWidget(BuildContext context, String title) {
  return MaterialApp(
    title: title,
    theme: BespokeTheme.theme,
    initialRoute: '/',
    routes: routes,
    debugShowCheckedModeBanner: false
  );
}
