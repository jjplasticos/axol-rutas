import 'package:axol_rutas/identities/user/cubit/login/login_cubit.dart';
import 'package:axol_rutas/identities/user/cubit/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginController {
  void login(dynamic context, String user, String password) {
    LoginCubit loginCubit = BlocProvider.of<LoginCubit>(context)
      ..checkLogin(user, password);
    BlocListener<LoginCubit, LoginState>(
      bloc: loginCubit,
      listener: (context, state) {
        if (state is LoginFailureState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.toString())));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('nada')));
        }
      },
      child: const Text('Hola mundo'),
    );
  }
}
