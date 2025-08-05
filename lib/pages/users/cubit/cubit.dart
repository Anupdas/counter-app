import 'package:bloc/bloc.dart';
import 'package:counter_app/models/user.dart';
import 'package:counter_app/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'state.dart';

/// View Model and handles the use cases
class UserListCubit extends Cubit<UserListState> {
  /// Constructor injection
  UserListCubit(this.repository) : super(UserListInitial());

  /// User repository fetches the data
  final UserRepository repository;

  final int _invocations = 0;

  /// Start the init process
  Future<void> initialize() => getUsers();

  /// Get the Users
  /// All the exceptions are handled,
  /// the exceptions are well defined and
  /// shows only user displayable errors
  /// error messages
  Future<void> getUsers() async {
    try {
      emit(UserListLoading());
      await Future.delayed(Duration(seconds: 1));

      /// This is to simulate an error
      // if (_invocations > 0 && kDebugMode) {
      //   emit(UserListError('Simulated user fetch error'));
      //   _invocations = 0;
      //   return;
      // } else {
      //   _invocations++;
      // }

      final users = await repository.getUsers();
      emit(UserListLoaded(users));
    } catch (e) {
      emit(UserListError('Unable to fetch users'));
    }
  }
}
