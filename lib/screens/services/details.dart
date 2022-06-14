import 'package:barber_flutter/models/service.dart';
import 'package:flutter/material.dart';

class ServiceDetailPage extends StatelessWidget {
  const ServiceDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Serviço'),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nome:\n${service['name']}",
                style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
