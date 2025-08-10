part of 'user_list_bloc.dart';

sealed class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object> get props => [];
}

final class UserListInitial extends UserListState {}

final class UserListLoading extends UserListState {}

final class UserListLoaded extends UserListState {
  final List<User> users;

  const UserListLoaded(this.users);
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
