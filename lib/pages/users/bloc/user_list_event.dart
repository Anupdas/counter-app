part of 'user_list_bloc.dart';

sealed class UserListEvent extends Equatable {
  const UserListEvent();

  @override
  List<Object> get props => [];
}

class UserListFetch extends UserListEvent {}

class SelectedUser extends UserListEvent {
  final User user;

  const SelectedUser(this.user);
}
