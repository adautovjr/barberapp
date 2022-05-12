import 'package:barber_flutter/screens/home.dart';
// Request
import 'package:barber_flutter/screens/requests/list.dart';
// Service
import 'package:barber_flutter/screens/services/create.dart';
import 'package:barber_flutter/screens/services/list.dart';
import 'package:barber_flutter/screens/users/create.dart';
import 'package:barber_flutter/screens/users/details.dart';
// User
import 'package:barber_flutter/screens/users/list.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => const Home(),
  // User
  '/users': (BuildContext context) => const UsersScreen(),
  '/user/create': (BuildContext context) => const CreateUserScreen(),
  '/user/details': (BuildContext context) => UserDetailPage(),
  // Service
  '/services': (BuildContext context) => const ServicesScreen(),
  '/service/create': (BuildContext context) => const CreateServiceScreen(),
  // Request
  '/requests': (BuildContext context) => const RequestsScreen(),
  '/requests/create': (BuildContext context) => const CreateServiceScreen(),
};
