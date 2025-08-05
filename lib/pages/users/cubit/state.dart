part of 'cubit.dart';

sealed class UserListState extends Equatable {
  const UserListState();
  @override
  List<Object> get props => [];
}

/// Starting point of the page,
/// this might contain any data passed to the page
/// as arguments or data received via routes such as users/{userId}
final class UserListInitial extends UserListState {}

/// Fetching the users, typically shows the loading indicator
final class UserListLoading extends UserListState {}

/// User fetch resulted in an error
final class UserListError extends UserListState {
  final String message;
  const UserListError(this.message);
  @override
  List<Object> get props => [message];
}

/// Successfully loaded the users
final class UserListLoaded extends UserListState {
  final List<User> users;
  const UserListLoaded(this.users);
  @override
  List<Object> get props => [users];
}
