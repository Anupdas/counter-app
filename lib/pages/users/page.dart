import 'package:counter_app/pages/users/cubit/cubit.dart';
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
        // Invoked at first access
        final repository = context.read<UserRepository>();

        /// Creates cubit
        final cubit = UserListCubit(repository);

        /// Fetches the data, equivalent to initState(), not awaited
        cubit.initialize();

        /// Returns cubit
        return cubit;
      },
      child: _UserListView(),
    );
  }
}

class _UserListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          IconButton(
            onPressed: () => context.read<UserListCubit>().getUsers(),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocBuilder<UserListCubit, UserListState>(
        //buildWhen: (previous, current) => (current is! UserListError),
        builder: (context, state) {
          if (state is UserListLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserListError) {
            return Center(child: Text(state.message));
          } else if (state is UserListLoaded) {
            /// Handle empty case
            if (state.users.isEmpty) {
              return ListTile(
                subtitle: Text(
                  'No Users found!',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              );
            }

            /// Positive use case
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, i) {
                final user = state.users[i];
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
