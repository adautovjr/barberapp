import 'package:barber_flutter/config/graphql_config.dart';
import 'package:barber_flutter/graphql/mutation.dart';
import 'package:barber_flutter/helpers/role_helper.dart';
import 'package:barber_flutter/models/user.dart';
import 'package:barber_flutter/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({Key? key}) : super(key: key);

  @override
  _CreateUserScreenState createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;

  String? selectedRole = getRoleItems().first.value;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create User'),
      ),
      drawer: const Menu(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // If the form is valid, display a Snackbar.
            createUser(
                role: selectedRole!,
                name: _nameController.text,
                email: _emailController.text,
                phone: _phoneController.text);
          } else {
            setState(() {
              _autovalidate = true;
            });
          }
        },
        child: const Icon(Icons.check),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode:
            _autovalidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: _buildForm(),
      ),
    );
  }

  Future<String> createUser({
    required String name,
    required String role,
    required String email,
    required String phone,
  }) async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
        MutationOptions(
          document: gql(
            createUserMutation,
          ),
          variables: {
            'data': {
              'role': role,
              'name': name,
              'email': email,
              'phone': phone,
            }
          },
        ),
      );
      if (result.hasException) {
        debugPrint(result.exception.toString());
      } else if (result.data != null) {
        //  parse your response here and return
        debugPrint(result.data!["createUser"].toString());
        User data = User.fromJson(result.data!["createUser"]);
        Navigator.of(context).pop(data);
      }

      return "";
    } catch (e) {
      debugPrint(e.toString());
      return "";
    }
  }

  _buildForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            value: selectedRole,
            hint: const Text("Select your state"),
            onChanged: (String? newValue) {
              setState(() {
                selectedRole = newValue!;
              });
            },
            items: getRoleItems(),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            controller: _nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            controller: _emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Phone',
            ),
            controller: _phoneController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
