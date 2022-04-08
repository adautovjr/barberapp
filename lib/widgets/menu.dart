import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu options',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.supervisor_account_rounded),
            title: Text('Users'),
            onTap: () {
              Navigator.of(context).pushNamed('/users');
            },
          ),
          ListTile(
            leading: Icon(Icons.content_cut_rounded),
            title: Text('Services'),
            onTap: () {
              Navigator.of(context).pushNamed('/services');
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today_rounded),
            title: Text('Requests'),
            onTap: () {
              Navigator.of(context).pushNamed('/requests');
            },
          ),
        ],
      ),
    );
  }
}
