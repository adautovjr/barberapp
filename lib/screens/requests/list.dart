import 'package:barber_flutter/graphql/query.dart';
import 'package:barber_flutter/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests'),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      drawer: const Menu(),
      // floatingActionButton: FloatingActionButton(
      // backgroundColor: Theme.of(context).backgroundColor,
      //   onPressed: () {
      //     Navigator.of(context).pushNamed('/requests/create');
      //   },
      //   child: const Icon(Icons.add),
      // ),
      body: Query(
        options: QueryOptions(
          document: gql(
            getRequestsQuery,
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

          List? requests = result.data?['requests'];

          if (requests == null || requests.isEmpty) {
            return const Text('No requests');
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: requests.length,
                    itemBuilder: (context, index) {
                      final request = requests[index];

                      return GestureDetector(
                        onTap: () {},
                        child: Container(
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
                                          request['name'] ?? '',
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                    Expanded(
                                      child: IconButton(
                                        icon: const Icon(Icons.open_in_new),
                                        color: Colors.black26,
                                        onPressed: () {},
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );

                      // return Text(request['serviceId'] ?? '');
                    }),
              )
            ],
          );
        },
      ),
    );
  }
}
