import 'package:axol_rutas/identities/user/cubit/login/login/login_cubit.dart';
import 'package:axol_rutas/identities/user/cubit/login/login/login_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginController extends StatelessWidget {
  const LoginController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {
        if (state is LoginFailureState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Hola mundo')));
        } else if (state is LoginSuccessState) {
          Navigator.popAndPushNamed(context, '/HomePage');
        } else if (state is LoginErrorState) {
          if (kDebugMode) {
            print('LoginErrorState: ${state.error}');
          }
        }
      },
      bloc: context.read<LoginCubit>(),
      child: const Text(''),
    );
  }
}
