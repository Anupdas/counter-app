import 'package:bloc/bloc.dart';
import 'package:counter_app/models/user.dart';
import 'package:counter_app/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this.repository) : super(UsersInitial());

  final UserRepository repository;

  /// Get the Users
  /// All the exceptions are handled,
  /// the exceptions are well defined and
  /// shows only user friendly internationalized/localized
  /// error messages
  void getUsers() async {
    try {
      emit(UsersLoading());
      await Future.delayed(Duration(seconds: 1));
      final users = await repository.getUsers();
      emit(UsersLoaded(users));
    } catch (e) {
      emit(UsersError('Unable to fetch users'));
    }
  }
}
