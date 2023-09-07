import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../sale/view/views/sales_view.dart';
import '../../view/controller/login_controller.dart';
import '../../view/pages/admin_page.dart';
import '../../view/views/splash_view.dart';
import '../login/login/login_cubit.dart';
import '../login/login_form_cubit.dart';
import 'auth_cubit.dart';
import 'auth_state.dart';

class AuthController extends StatelessWidget {
  const AuthController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      bloc: BlocProvider.of<AuthCubit>(context)..getUserState(),
      builder: (BuildContext context, AuthState state) {
        if (state is AuthLoadingState) {
          return const SplashView();
        } else if (state is AuthAuthenticatedState) {
          final rol = state.user.rol;
          if (rol == 'admin') {
            return AdminPage(
              user: state.user,
            );
          } else if (rol == 'vendor') {
            // ignore: prefer_const_constructors
            return SalesView();
          } else {
            return const Text('Error: no entro a ni una pagina.');
          }
        } else if (state is AuthUnuauthenticatedState) {
          return Center(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => LoginFormCubit()),
                BlocProvider(create: (_) => LoginCubit())
              ],
              child: LoginController(),
            )
           //LoginPage()
           );
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
