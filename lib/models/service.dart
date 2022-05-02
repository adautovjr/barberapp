class Service {
  final String id;
  final String? name;
  final num? price;
  final num? duration;

  Service({
    required this.id,
    this.name,
    this.price,
    this.duration,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'] as String,
      name: json['name'] != null ? json['name'] as String : null,
      price: json['price'] != null ? json['price'] as num : null,
      duration: json['duration'] != null ? json['duration'] as num : null,
    );
  }
}
