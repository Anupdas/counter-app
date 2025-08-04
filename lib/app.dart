import 'package:flutter/material.dart';

import 'pages/users/page.dart';

class BlocApp extends StatelessWidget {
  const BlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: UsersPage());
  }
}
