import 'package:counter_app/pages/users/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'tile.dart';

class UserView extends StatelessWidget {
  const UserView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          IconButton(
            onPressed: () => context.read<UsersCubit>().getUsers(),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UsersError) {
            return Center(child: Text(state.message));
          } else if (state is UsersLoaded) {
            if (state.users.isEmpty) {
              return ListTile(
                subtitle: Text(
                  'No Users found!',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              );
            }

            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, i) {
                final user = state.users[i];
                return UserListTile(user: user);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
