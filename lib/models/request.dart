import 'package:barber_flutter/models/service.dart';
import 'package:barber_flutter/models/user.dart';

class Request {
  final String id;
  final Service? service;
  final User? barber;
  final User? client;
  final double? price;
  final double? date;

  Request({
    required this.id,
    required this.service,
    required this.barber,
    required this.client,
    required this.price,
    required this.date,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      id: json['id'] as String,
      service: json['service'] != null
          ? Service.fromJson(json['service'] as Map<String, dynamic>)
          : null,
      barber: json['barber'] != null
          ? User.fromJson(json['barber'] as Map<String, dynamic>)
          : null,
      client: json['client'] != null
          ? User.fromJson(json['client'] as Map<String, dynamic>)
          : null,
      price: json['price'] != null ? json['price'] as double : null,
      date: json['date'] != null ? json['date'] as double : null,
    );
  }
}
