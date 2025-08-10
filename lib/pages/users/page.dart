import 'package:counter_app/pages/details/page.dart';
import 'package:counter_app/pages/users/bloc/user_list_bloc.dart';
import 'package:counter_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './views/tile.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final repository = context.read<UserRepository>();
        final bloc = UserListBloc(repository);
        bloc.add(UserListFetch());
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Users')),
        body: _UserListView(),
      ),
    );
  }
}

class _UserListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserListBloc, UserListState>(
      listener: (context, state) {
        if (state is UserListSelected) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => UserDetailsPage(
                user: state.user,
              ),
            ),
          );
        }
      },
      buildWhen: (prev, cur) => cur is! UserListSelected,
      builder: (context, state) {
        if (state is UserListLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is UserListError) {
          return Center(child: Text('Unable to fetch users!'));
        } else if (state is UserListLoaded) {
          final users = state.users;

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
                onTap: () {
                  context.read<UserListBloc>().add(SelectedUser(user));
                },
              );
            },
          );
        }

        return Container();
      },
    );
  }
}
