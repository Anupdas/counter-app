import 'package:counter_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './views/tile.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: FutureBuilder(
        future: context.read<UserRepository>().getUsers(),
        builder: (context, snapshot) {
          final state = snapshot.connectionState;
          if (state == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (state == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Unable to fetch users!'));
            }

            final users = snapshot.data ?? [];

            /// Handle empty case
            if (users.isEmpty) {
              return ListTile(
                subtitle: Text(
                  'No Users found!',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              );
            }

            /// Positive use case
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, i) {
                final user = users[i];
                return UserListTile(
                  name: user.name,
                  email: user.email ?? 'n/a',
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
