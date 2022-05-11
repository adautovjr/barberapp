import 'package:barber_flutter/config/graphql_config.dart';
import 'package:barber_flutter/graphql/mutation.dart';
import 'package:barber_flutter/models/service.dart';
import 'package:barber_flutter/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CreateServiceScreen extends StatefulWidget {
  const CreateServiceScreen({Key? key}) : super(key: key);

  @override
  _CreateServiceScreenState createState() => _CreateServiceScreenState();
}

class _CreateServiceScreenState extends State<CreateServiceScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Service'),
      ),
      drawer: const Menu(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // If the form is valid, display a Snackbar.
            createService(
              name: _nameController.text,
              price: double.parse(_priceController.text),
              duration: int.parse(_durationController.text),
            );
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

  Future<String> createService({
    required String name,
    required double price,
    required int duration,
  }) async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
        MutationOptions(
          document: gql(
            createServiceMutation,
          ),
          variables: {
            'data': {
              'name': name,
              'price': price.toString(),
              'duration': duration,
            }
          },
        ),
      );
      if (result.hasException) {
        debugPrint(result.exception.toString());
      } else if (result.data != null) {
        //  parse your response here and return
        debugPrint(result.data!["createService"].toString());
        Service data = Service.fromJson(result.data!["createService"]);
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
              labelText: 'Price',
            ),
            controller: _priceController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Duration',
            ),
            controller: _durationController,
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
