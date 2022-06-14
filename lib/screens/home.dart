import 'package:barber_flutter/controller/session.dart';
import 'package:barber_flutter/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_platform/universal_platform.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Barber App'),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        drawer: const Menu(),
        body: Center(
          child:
              Consumer<SessionController>(builder: (context, session, child) {
            return Text(
              "USER: ${session.username} \n"
              "Web: ${UniversalPlatform.isWeb} \n"
              "MacOS: ${UniversalPlatform.isMacOS} \n"
              "Windows: ${UniversalPlatform.isWindows} \n"
              "Linux: ${UniversalPlatform.isLinux} \n"
              "Android: ${UniversalPlatform.isAndroid} \n"
              "IOS: ${UniversalPlatform.isIOS} \n"
              "Fuschia: ${UniversalPlatform.isFuchsia} \n",
              style: Theme.of(context).textTheme.headline6,
            );
          }),
        ));
  }
}
