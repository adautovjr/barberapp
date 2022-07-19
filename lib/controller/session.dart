import 'dart:ffi';
import 'dart:io';

import 'package:barber_flutter/config/graphql_config.dart';
import 'package:barber_flutter/graphql/query.dart';
import 'package:barber_flutter/models/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SessionController extends ChangeNotifier {
  String? _id;
  String? _name;
  String? _email;
  Enum? _role;
  String? _phone;
  Image? _image;

  Future<bool> login(String email, String pass) async {
    try {
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
        MutationOptions(
          document: gql(
            findFirstUserQuery,
          ),
          variables: {
            'filter': {
              'email': {"equals": email}
            }
          },
        ),
      );
      if (result.hasException) {
        debugPrint(result.exception.toString());
        return false;
      } else if (result.data != null && result.data!["findFirstUser"] != null) {
        //  parse your response here and return
        User user = User.fromJson(result.data!["findFirstUser"]);
        _id = user.id;
        _role = user.role;
        _phone = user.phone!;
        _name = user.name!;
        _email = user.email!;
        _image = await _getUserImage(_id as String);
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  Future<Image> _getUserImage(String imageURL) async {
    final ref =
        FirebaseStorage.instance.ref().child('user_images/').child(imageURL);
    var url = await ref.getDownloadURL();
    return Image.network(url);
  }

  Image? get image => _image;
  String? get username => _name;
}
