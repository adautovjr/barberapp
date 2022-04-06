import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String getServicesQuery = """
  query {
    allServices {
      id
      name
      price
      duration
    }
  }
""";

void main() async {
  await initHiveForFlutter();

  final httpLink = HttpLink(
    'http://127.0.0.1:3000/graphql',
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  runApp(BarberApp(client: client));
}

class Service {
  final String id;
  final String name;
  final double price;
  final int duration;

  const Service(
      {required this.id,
      required this.name,
      required this.price,
      required this.duration});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      duration: json['duration'],
    );
  }
}

class BarberApp extends StatefulWidget {
  ValueNotifier<GraphQLClient> client;

  BarberApp({Key? key, required this.client}) : super(key: key);

  @override
  State<BarberApp> createState() => MyApp();
}

class MyApp extends State<BarberApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: widget.client,
      child: MaterialApp(
        title: 'Fetch Data Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Fetch Data Example'),
          ),
          body: Query(
            options: QueryOptions(
              document: gql(
                  getServicesQuery), // this is the query string you just created
              variables: {},
              pollInterval: const Duration(seconds: 10),
            ),
            // Just like in apollo refetch() could be used to manually trigger a refetch
            // while fetchMore() can be used for pagination purpose
            builder: (QueryResult result,
                {VoidCallback? refetch, FetchMore? fetchMore}) {
              if (result.hasException) {
                debugPrint(result.exception.toString());
                return Text(result.exception.toString());
              }

              if (result.isLoading) {
                return const Text('Loading');
              }

              List? services = result.data?['allServices'];

              if (services == null) {
                return const Text('No services');
              }

              return Center(
                child: ListView.builder(
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      final service = services[index];

                      return Text(service['name'] ?? '');
                    }),
              );
            },
          ),
        ),
      ),
    );
  }
}
