import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/session.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  var user = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'El Barbero',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: 300,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView(
                        children: <Widget>[
                          TextField(
                            controller: user,
                            decoration: InputDecoration(
                              labelText: 'User',
                            ),
                          ),
                          TextField(
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                                onPressed: () {
                                  Provider.of<SessionController>(context,
                                          listen: false)
                                      .login(user.text, password.text);
                                  Navigator.of(context).pushNamed('/home');
                                },
                                child: const Text('Login')),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
