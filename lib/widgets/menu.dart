import 'package:barber_flutter/controller/session.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Consumer<SessionController>(
              builder: (context, session, child) {
                return Text(
                'Welcome, ${session.username}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                );
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.supervisor_account_rounded),
            title: const Text('Users'),
            onTap: () {
              Navigator.of(context).pushNamed('/users');
            },
          ),
          ListTile(
            leading: const Icon(Icons.content_cut_rounded),
            title: const Text('Services'),
            onTap: () {
              Navigator.of(context).pushNamed('/services');
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today_rounded),
            title: const Text('Requests'),
            onTap: () {
              Navigator.of(context).pushNamed('/requests');
            },
          ),
        ],
      ),
    );
  }
}
