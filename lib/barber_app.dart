import 'package:barber_flutter/widgets/templates/cupertino.dart';
import 'package:barber_flutter/widgets/templates/material.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:universal_platform/universal_platform.dart';

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
    // if (UniversalPlatform.isAndroid) {
    //   debugPrint("Android");
    //   return GraphQLProvider(
    //     client: widget.client,
    //     child: materialWidget(context, 'Hi Android with Material!'),
    //   );
    // } else if (UniversalPlatform.isIOS) {
    //   debugPrint("isIOS");
    //   return GraphQLProvider(
    //     client: widget.client,
    //     child: cupertinoWidget(context, 'Hi iOS with Material!'),
    //   );
    // }
    debugPrint("Web");
    return GraphQLProvider(
      client: widget.client,
      child: materialWidget(context, 'Hi Web!'),
    );
  }
}
