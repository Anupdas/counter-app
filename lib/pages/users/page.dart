import 'package:counter_app/pages/details/page.dart';
import 'package:counter_app/pages/users/bloc/user_list_bloc.dart';
import 'package:counter_app/repositories/user_repository.dart';
import 'package:easy_debounce/easy_debounce.dart';
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
        return UserListBloc(repository)..add(FetchUsers());
      },
      child: _UserListView(),
    );
  }
}

class _UserListView extends StatefulWidget {
  @override
  State<_UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<_UserListView> {
  final FocusNode searchTextNode = FocusNode();

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
        } else if (state is UserListLoaded) {
          if (state.showSearchBar) {
            Future.delayed(Duration(milliseconds: 100), () {
              if (searchTextNode.canRequestFocus) {
                searchTextNode.requestFocus();
              }
            });
          }
        }
      },
      buildWhen: (prev, cur) => cur is! UserListSelected,
      builder: (context, state) {
        Widget body = Container();
        bool showSearchBar = false;
        final bloc = context.read<UserListBloc>();
        if (state is UserListLoading) {
          body = Center(child: CircularProgressIndicator());
        } else if (state is UserListError) {
          body = Center(child: Text('Unable to fetch users!'));
        } else if (state is UserListLoaded) {
          final users =
              (state.showSearchBar ? state.filteredUsers : state.users) ?? [];
          showSearchBar = state.showSearchBar;

          /// Handle empty case
          if (users.isEmpty) {
            body = ListTile(
              subtitle: Text(
                'No Users found!',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            );
          }

          /// Positive use case
          body = ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, i) {
              final user = users[i];
              return UserListTile(
                name: user.name,
                email: user.email ?? 'n/a',
                onTap: () => bloc.add(SelectedUser(user)),
              );
            },
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: (state is UserListLoaded) && state.showSearchBar
                ? _UserSearchField(searchTextNode: searchTextNode)
                : Text('Users'),

            actions: [
              IconButton(
                onPressed: () => bloc.add(ToggleUserSearch(!showSearchBar)),
                icon: Icon(showSearchBar ? Icons.close : Icons.search),
              ),
            ],
          ),
          body: body,
        );
      },
    );
  }
}

class _UserSearchField extends StatelessWidget {
  const _UserSearchField({this.searchTextNode});

  final FocusNode? searchTextNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: searchTextNode,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.all(12),
        hintText: 'Search by name or email',
      ),

      onChanged: (value) {
        EasyDebounce.debounce(
          'search_user',
          Durations.medium1,
          () => context.read<UserListBloc>().add(SearchUser(value)),
        );
      },
    );
  }
}
