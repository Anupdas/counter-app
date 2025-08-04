import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class ApiService {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  /// Fetch users
  Future<List<User>> fetchUsers() async {
    final res = await http.get(Uri.parse('$baseUrl/users'));
    if (res.statusCode == 200) {
      final records = jsonDecode(res.body) as List;
      return records.map((e) => User.fromJson(e)).toList();
    } else {
      throw ApiException(res.statusCode, 'Error fetching users');
    }
  }
}

class ApiException {
  final int code;
  final String errorMessage;

  ApiException(this.code, this.errorMessage);
}
