import 'package:axol_rutas/identities/user/cubit/login/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settings/theme.dart';
import '../../cubit/login/login_form_cubit.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    String user;
    String password;
    FocusNode focusNode = FocusNode();
    //int focus = context.read<LoginFormCubit>().state.focus;
    /*if (focus == 2) {
      focusNode.requestFocus();
    }*/

    return ElevatedButton(
      focusNode: focusNode,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 58),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: ColorPalette.primary,
      ),
      onPressed: () async {
        user = context.read<LoginFormCubit>().state.userName.value;
        password = context.read<LoginFormCubit>().state.password.value;
        context.read<LoginCubit>().checkLogin(user, password);
        //const LoginController();
      },
      child: const Text(
        'Iniciar',
        style: Typo.textButton,
      ),
    );
  }
}
