import 'package:counter_app/pages/users/cubit/users_cubit.dart';
import 'package:counter_app/pages/users/views/view.dart';
import 'package:counter_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final repository = context.read<UserRepository>();
        final cubit = UsersCubit(repository);
        cubit.getUsers();
        return cubit;
      },
      child: UserView(),
    );
  }
}
