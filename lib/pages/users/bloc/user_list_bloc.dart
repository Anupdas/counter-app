import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter_app/repositories/user_repository.dart';
import 'package:counter_app/services/api/service.dart';
import 'package:equatable/equatable.dart';

import '../../../models/user.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc(this.repository) : super(UserListInitial()) {
    on<FetchUsers>(_onUserListFetch);
    on<SelectedUser>(_onSelectedUser);
    on<ToggleUserSearch>(_onToggleUserSearch);
    on<SearchUser>(_onSearchUser);
  }

  final UserRepository repository;

  Future<void> _onUserListFetch(event, emit) async {
    emit(UserListLoading());

    try {
      final users = await repository.getUsers();
      emit(UserListLoaded(users));
    } catch (e) {
      final message = (e is ApiException)
          ? e.errorMessage
          : 'Unable to load users';
      emit(UserListError(message));
    }
  }

  void _onSelectedUser(SelectedUser event, emit) {
    emit(UserListSelected(event.user));
  }

  void _onSearchUser(SearchUser event, emit) {
    if (state is UserListLoaded) {
      final currentState = state as UserListLoaded;

      List<User>? filteredUsers = [];
      if (event.searchText.isNotEmpty) {
        final text = event.searchText.toLowerCase();
        filteredUsers = currentState.users
            .where((e) => e.name.toLowerCase().contains(text))
            .toList();
      } else {
        filteredUsers = currentState.users;
      }

      emit(
        currentState.copyWith(
          searchText: event.searchText,
          filteredUsers: filteredUsers,
        ),
      );
    }
  }

  void _onToggleUserSearch(ToggleUserSearch event, emit) {
    if (state is UserListLoaded) {
      final currentState = state as UserListLoaded;
      emit(
        currentState.copyWith(
          showSearchBar: event.showSearchBar,
          searchText: '',
          filteredUsers: [],
        ),
      );
    }
  }
}
