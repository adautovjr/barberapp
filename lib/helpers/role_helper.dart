import 'package:flutter/material.dart';
import 'package:barber_flutter/models/user.dart';

List<DropdownMenuItem<String>> getRoleItems() => List.generate(
      Role.values.length,
      (index) => DropdownMenuItem(
        value: Role.values
            .elementAt(index)
            .toString()
            .replaceFirst(RegExp(r'Role.'), ''),
        child: Text(Role.values
            .elementAt(index)
            .toString()
            .replaceFirst(RegExp(r'Role.'), '')),
      ),
    );
