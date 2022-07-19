import 'package:barber_flutter/screens/home.dart';
import 'package:barber_flutter/screens/login.dart';
import 'package:barber_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    if (auth.isLoading) {
      return loading();
    } else if (auth.user == null) {
      return const LoginScreen();
    } else {
      return const Home();
    }
  }

  loading() {
    return const Scaffold(
      body: const Center(
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
