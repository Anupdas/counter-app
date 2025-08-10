part of 'bloc.dart';

sealed class UserListEvent extends Equatable {
  const UserListEvent();

  @override
  List<Object> get props => [];
}

class FetchUser extends UserListEvent {}

class SelectUser extends UserListEvent {
  final User user;

  const SelectUser({required this.user});
}
