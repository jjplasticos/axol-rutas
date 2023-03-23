import 'package:axol_rutas/identities/user/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view/pages/login_page.dart';
import '../../view/views/splash_view.dart';
import 'auth_cubit.dart';
import 'auth_state.dart';

class AuthController extends StatelessWidget {
  const AuthController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      bloc: BlocProvider.of<AuthCubit>(context)..getUser(),
      builder: (BuildContext context, AuthState state) {
        if (state is AuthLoadingState) {
          return const SplashView();
        } else if (state is AuthAuthenticatedState) {
          return const Center(child: HomePage());
        } else if (state is AuthUnuauthenticatedState) {
          return const Center(child: LoginPage());
        } else if (state is AuthErrorState) {
          return Center(
            child: Text(state.toString()),
          );
        } else {
          return const Center(
            child: Text('Error: no se recibió estado.'),
          );
        }
      },
    );
  }
}
