import 'package:bloc/bloc.dart';
import 'package:counter_app/repositories/user_repository.dart';
import 'package:counter_app/services/api/service.dart';
import 'package:equatable/equatable.dart';

import '../../../models/user.dart';

part 'event.dart';
part 'state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc(this.repository) : super(UserListInitial()) {
    on<FetchUser>((event, emit) async {
      emit(UserListLoading());
      try {
        final users = await repository.getUsers();
        await Future.delayed(Duration(seconds: 1));
        emit(UserListLoaded(users));
      } on ApiException catch (e) {
        emit(UserListError(e.message));
      } catch (e) {
        emit(UserListError('Unable to fetch users, please retry!'));
      }
    });
  }

  final UserRepository repository;
}
