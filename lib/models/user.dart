import 'package:equatable/equatable.dart';

class User with EquatableMixin {
  final int id;
  final String name;
  final String? username;
  final String? email;
  final String? phone;

  User({
    required this.id,
    required this.name,
    this.username,
    this.email,
    this.phone,
  });

  User copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    String? phone,
  }) => User(
    id: id ?? this.id,
    name: name ?? this.name,
    username: username ?? this.username,
    email: email ?? this.email,
    phone: phone ?? this.phone,
  );

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "phone": phone,
  };

  @override
  List<Object?> get props => [id, name, username, email, phone];
}
