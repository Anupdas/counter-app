import 'package:counter_app/repositories/user_repository.dart';
import 'package:counter_app/services/api/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/users/page.dart';

class BlocApp extends StatelessWidget {
  const BlocApp({super.key, required this.service});

  final ApiService service;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => UserRepository(service),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: UserListPage(),
      ),
    );
  }
}
