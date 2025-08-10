import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.name,
    required this.email,
    this.onTap,
  });

  final String name, email;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
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
