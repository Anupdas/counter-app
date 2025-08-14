part of 'user_list_bloc.dart';

sealed class UserListEvent extends Equatable {
  const UserListEvent();

  @override
  List<Object> get props => [];
}

class FetchUsers extends UserListEvent {}

class SelectedUser extends UserListEvent {
  final User user;

  const SelectedUser(this.user);
}

class ToggleUserSearch extends UserListEvent {
  final bool showSearchBar;

  const ToggleUserSearch(this.showSearchBar);
}

class SearchUser extends UserListEvent {
  final String searchText;

  const SearchUser(this.searchText);
}
