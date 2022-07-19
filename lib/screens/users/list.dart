import 'package:barber_flutter/controller/session.dart';
import 'package:barber_flutter/graphql/query.dart';
import 'package:barber_flutter/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  Future<void> _ShowDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Consumer<SessionController>(
          builder: (context, session, child) {
            return AlertDialog(
              title: const Text('Our consumer'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Hello, ${session.username}'),
                    const Text('Would you like to approve of this message?'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        backgroundColor: Theme.of(context).backgroundColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            onPressed: () {
              _ShowDialog();
            },
          ),
        ],
      ),
      drawer: const Menu(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/user/create');
        },
        backgroundColor: Theme.of(context).backgroundColor,
        child: const Icon(Icons.add),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(
            getUsersQuery,
          ), // this is the query string you just created
          variables: {},
          pollInterval: const Duration(seconds: 10),
        ),
        // Just like in apollo refetch() could be used to manually trigger a refetch
        // while fetchMore() can be used for pagination purpose
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            // debugPrint(result.exception.toString());
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const Text('Loading');
          }

          List? users = result.data?['users'];

          if (users == null || users.isEmpty) {
            return const Text('No users');
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];

                        return Container(
                          padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
                          width: 1,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 3,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          user['name'] ?? '',
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                    Expanded(
                                      child: IconButton(
                                        icon: const Icon(Icons.open_in_new),
                                        color: Colors.black26,
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(
                                            '/user/details',
                                            arguments: user,
                                          );
                                        },
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
