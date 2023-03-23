import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settings/theme.dart';
import '../../cubit/login/login/login_cubit.dart';
import '../../cubit/login/password_visibility/password_visibility_cubit.dart';
import '../../cubit/login/password_visibility/password_visibility_state.dart';

class ButtonLogin extends StatelessWidget {
  final String user;
  final String password;

  const ButtonLogin({super.key, required this.user, required this.password});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityState>(
        builder: (context, state) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 58),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: () async {
          //context.read<LoginCubit>().checkLogin(user, password),
          context.read<PasswordVisibilityCubit>();
          print(user);
          print(password);
        },
        child: const Text(
          'Iniciar',
          style: Typo.textButton,
        ),
      );
    });
  }
}
