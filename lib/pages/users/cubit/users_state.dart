part of 'users_cubit.dart';

sealed class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

/// Starting point of the page,
/// this might contain any data passed to the page
/// as arguments or data received via routes such as users/{userId}
final class UsersInitial extends UsersState {}

/// Fetching the users, typically shows the loading indicator
final class UsersLoading extends UsersState {}

/// Successfully loaded the users
final class UsersLoaded extends UsersState {
  final List<User> users;

  const UsersLoaded(this.users);

  @override
  List<Object> get props => [users];
}

/// User fetch resulted in an error
final class UsersError extends UsersState {
  final String message;

  const UsersError(this.message);

  @override
  List<Object> get props => [message];
}
