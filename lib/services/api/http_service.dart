import 'dart:convert';

import 'package:counter_app/services/api/service.dart';
import 'package:http/http.dart' as http;

import '../../models/user.dart';

class HttpApiService implements ApiService {
  /// Based on flavors this can also be injected via constructor
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  /// Fetch users
  @override
  Future<List<User>> fetchUsers() async {
    final res = await http.get(
      Uri.parse('$baseUrl/users'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (res.statusCode == 200) {
      final records = jsonDecode(res.body) as List;
      return records.map((e) => User.fromJson(e)).toList();
    } else {
      throw ApiException(res.statusCode, 'Error fetching users');
    }
  }
}
