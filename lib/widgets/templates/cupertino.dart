import 'package:flutter/cupertino.dart';
import 'package:barber_flutter/routes.dart';

Widget cupertinoWidget(BuildContext context, String title) {
  return CupertinoApp(
    title: title,
    // theme: ThemeData(
    //   primarySwatch: Colors.blue,
    // ),
    initialRoute: '/',
    routes: routes,
    debugShowCheckedModeBanner: false,
  );
}
