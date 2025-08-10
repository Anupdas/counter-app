import 'package:bloc/bloc.dart';
import 'package:counter_app/repositories/user_repository.dart';
import 'package:counter_app/services/api/service.dart';
import 'package:equatable/equatable.dart';

import '../../../models/user.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc(this.repository) : super(UserListInitial()) {
    on<UserListFetch>((event, emit) async {
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
    });

    on<SelectedUser>((event, emit) {
      emit(UserListSelected(event.user));
    });
  }

  final UserRepository repository;
}
