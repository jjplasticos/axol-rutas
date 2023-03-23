import 'dart:js';

import 'package:axol_rutas/identities/user/cubit/login/login_cubit.dart';
import 'package:axol_rutas/identities/user/cubit/login/login_state.dart';
import 'package:axol_rutas/identities/user/view/widgets/button_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/login/login_controller.dart';

import '../../../../settings/theme.dart';
import '../widgets/logo.dart';
import '../widgets/text_field_user.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            SizedBox(
              width: double.infinity,
              height: 210,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const TextFieldUser(),
                  const Text('TextFieldPassword'),
                  const ButtonLogin(),
                  BlocListener(
                    listener: (context, state) {
                      if (state is LoginFailureState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Hola mundo')));
                      }
                    },
                    bloc: context.read<LoginCubit>(),
                    child: BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) => Text(state.toString())),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
