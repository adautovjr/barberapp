import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:barber_flutter/routes.dart';

class BarberApp extends StatefulWidget {
  ValueNotifier<GraphQLClient> client;

  BarberApp({Key? key, required this.client}) : super(key: key);

  @override
  State<BarberApp> createState() => MyApp();
}

class MyApp extends State<BarberApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: widget.client,
      child: MaterialApp(
        title: 'Barber App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
