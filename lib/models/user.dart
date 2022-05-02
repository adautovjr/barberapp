// ignore_for_file: constant_identifier_names

enum Role {
  ADMIN,
  BARBER,
  GUEST,
}

class User {
  final String id;
  final Role role;
  final String? name;
  final String? email;
  final String? phone;

  User({
    required this.id,
    required this.role,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    print(json.toString());
    return User(
      id: json['id'] as String,
      role: Role.values.firstWhere(
          (e) => e.toString() == "Role.${json['role']}",
          orElse: () => Role.GUEST),
      name: json['name'] != null ? json['name'] as String : null,
      email: json['email'] != null ? json['email'] as String : null,
      phone: json['phone'] != null ? json['phone'] as String : null,
    );
  }
}
