import 'package:barber_flutter/graphql/query.dart';
import 'package:barber_flutter/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      drawer: const Menu(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).backgroundColor,
        onPressed: () {
          Navigator.of(context).pushNamed('/service/create');
        },
        child: const Icon(Icons.add),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(
            getServicesQuery,
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

          List? services = result.data?['services'];

          if (services == null || services.isEmpty) {
            return const Text('No services');
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
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        final service = services[index];

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
                                            service['name'] ?? '',
                                            style:
                                                const TextStyle(fontSize: 20),
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
                                              '/service/details',
                                              arguments: service,
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
