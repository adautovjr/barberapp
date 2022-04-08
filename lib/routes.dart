import 'package:barber_flutter/screens/home.dart';
import 'package:barber_flutter/screens/requests.dart';
import 'package:barber_flutter/screens/services.dart';
import 'package:barber_flutter/screens/users.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => const Home(),
  '/users': (BuildContext context) => const UsersScreen(),
  '/services': (BuildContext context) => const ServicesScreen(),
  '/requests': (BuildContext context) => const RequestsScreen(),
};
