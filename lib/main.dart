import 'package:barber_flutter/barber_app.dart';
import 'package:barber_flutter/config/graphql_config.dart';
import 'package:barber_flutter/controller/session.dart';
import 'package:barber_flutter/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await initHiveForFlutter();
  await Firebase.initializeApp();
  //GraphQLConfig init
  ValueNotifier<GraphQLClient> client = GraphQLConfig.graphInit();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (_) => SessionController(),
        ),
      ],
      child: BarberApp(client: client),
    ),
  );
}
