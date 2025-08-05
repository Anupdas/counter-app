import 'package:flutter/material.dart';

import '../../../models/user.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        user.name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        (user.email ?? '-').toLowerCase(),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
