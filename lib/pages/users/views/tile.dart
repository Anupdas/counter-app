import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({super.key, required this.name, required this.email});

  final String name, email;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        email.toLowerCase(),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
