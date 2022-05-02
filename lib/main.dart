import 'package:barber_flutter/barber_app.dart';
import 'package:barber_flutter/config/graphql_config.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initHiveForFlutter();
  //GraphQLConfig init
  ValueNotifier<GraphQLClient> client = GraphQLConfig.graphInit();
  runApp(BarberApp(client: client));
}
