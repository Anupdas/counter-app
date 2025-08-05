import 'dart:convert';

import 'package:counter_app/models/user.dart';
import 'package:counter_app/services/api/service.dart';
import 'package:flutter/services.dart';

class MockApiService implements ApiService {
  @override
  Future<List<User>> fetchUsers() async {
    try {
      final path = 'assets/data/users.json';
      final data = await rootBundle.loadString(path);
      final records = jsonDecode(data) as List;
      return records.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      throw ApiException(500, 'Internal server error');
    }
  }
}
