import 'package:barber_flutter/screens/home.dart';
import 'package:barber_flutter/screens/login.dart';
// Request
import 'package:barber_flutter/screens/requests/list.dart';
// Service
import 'package:barber_flutter/screens/services/create.dart';
import 'package:barber_flutter/screens/services/details.dart';
import 'package:barber_flutter/screens/services/list.dart';
// User
import 'package:barber_flutter/screens/users/create.dart';
import 'package:barber_flutter/screens/users/details.dart';
import 'package:barber_flutter/screens/users/list.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  '/home': (BuildContext context) => const Home(),
  '/': (BuildContext context) => const LoginScreen(),
  // User
  '/users': (BuildContext context) => const UsersScreen(),
  '/user/create': (BuildContext context) => const CreateUserScreen(),
  '/user/details': (BuildContext context) => const UserDetailPage(),
  // Service
  '/services': (BuildContext context) => const ServicesScreen(),
  '/service/create': (BuildContext context) => const CreateServiceScreen(),
  '/service/details': (BuildContext context) => const ServiceDetailPage(),
  // Request
  '/requests': (BuildContext context) => const RequestsScreen(),
  '/requests/create': (BuildContext context) => const CreateServiceScreen(),
};
