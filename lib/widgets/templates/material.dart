import 'package:flutter/material.dart';
import 'package:barber_flutter/routes.dart';

Widget materialWidget(BuildContext context, String title) {
  return MaterialApp(
    title: title,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: '/',
    routes: routes,
    debugShowCheckedModeBanner: false,
  );
}
