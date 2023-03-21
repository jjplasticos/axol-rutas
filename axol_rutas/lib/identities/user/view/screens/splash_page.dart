import 'package:axol_rutas/identities/user/cubit/auth/auth_bloc.dart';
import 'package:axol_rutas/identities/user/cubit/auth/auth_cubit.dart';
import 'package:axol_rutas/identities/user/cubit/auth/auth_event.dart';
import 'package:axol_rutas/identities/user/cubit/auth/auth_state.dart';
import 'package:axol_rutas/identities/user/cubit/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPage createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  late AuthBloc bloc;

  @override
  Widget build(BuildContext context) {
    /*UserProvider userProvider = UserProvider();
    AuthState state;
    Scaffold widget = const Scaffold();

    state = userProvider.authBloc(AppStarted());
    //print(state.toString());
    if (state is AuthLoading) {
      widget = const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
      state = userProvider.authBloc(LoggedIn());
      //print(state.toString());
      if (state is AuthAuthenticated) {
        print('Entro a Sales Page');
        Navigator.pushReplacementNamed(context, '/SalesPage');
      } else if (state is AuthUnuauthenticated) {
        Navigator.pushReplacementNamed(context, '/LoginPage');
        print('Entro a Login page');
      }
      
    }*/

    //BlocProvider<AuthCubit>(create: (context) => AuthCubit());
    final state = context.watch<AuthCubit>().state;

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (BuildContext context, AuthState state) {
        if (state is AuthUnitializedState) {
          return const Center(
            child: Text('Inicio'),
          );
        }
        if (state is AuthLoadingState) {
          return const Center(
            child: Text('Loading...'),
          );
          /*bloc = BlocProvider.of<AuthBloc>(context);
          bloc.add(AppStarted());*/
        } else if (state is AuthAuthenticatedState) {
          return const Center(
            child: Text('Autenticated!'),
          );
        } else if (state is AuthUnuauthenticatedState) {
          return const Center(
            child: Text('Unuauthenticated'),
          );
        } else if (state is AuthErrorState) {
          return const Center(
            child: Text('Error'),
          );
        } else {
          return const Center(
            child: Text('No paso nada.'),
          );
        }
      },
    );
  }
}
