part of 'user_list_bloc.dart';

sealed class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object?> get props => [];
}

final class UserListInitial extends UserListState {}

final class UserListLoading extends UserListState {}

final class UserListLoaded extends UserListState {
  final List<User> users;
  final bool showSearchBar;
  final String? searchText;
  final List<User>? filteredUsers;

  const UserListLoaded(
    this.users, {
    this.showSearchBar = false,
    this.searchText,
    this.filteredUsers,
  });

  UserListLoaded copyWith({
    List<User>? users,
    bool? showSearchBar,
    String? searchText,
    List<User>? filteredUsers,
  }) {
    return UserListLoaded(
      users ?? this.users,
      showSearchBar: showSearchBar ?? this.showSearchBar,
      searchText: searchText ?? this.searchText,
      filteredUsers: filteredUsers ?? this.filteredUsers,
    );
  }

  @override
  List<Object?> get props => [users, showSearchBar, searchText, filteredUsers];
}

final class UserListError extends UserListState {
  final String message;

  const UserListError(this.message);
}

final class UserListSelected extends UserListState {
  final User user;

  const UserListSelected(this.user);

  @override
  List<Object> get props => [user];
}
