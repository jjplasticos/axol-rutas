import 'package:axol_rutas/identities/user/cubit/login/password_visibility/password_visibility_controller.dart.dart';
import 'package:axol_rutas/identities/user/cubit/login/password_visibility/password_visibility_cubit.dart';
import 'package:axol_rutas/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/login/password_visibility/password_visibility_state.dart';

class TextFieldPassword extends StatelessWidget {
  String textPassword;

  TextFieldPassword({super.key, required this.textPassword});

  @override
  Widget build(BuildContext context) {
    bool obs = true;

    return BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: obs,
          onChanged: (value) {
            textPassword = value;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            hintText: 'Contraseña',
            hintStyle: Typo.hintText,
            suffixIcon: IconButton(
              icon: const PasswordVisibilityController(),
              onPressed: () async {
                context.read<PasswordVisibilityCubit>().visibility();
                obs = await context.read<PasswordVisibilityCubit>().isVisible();
              },
            ),
            filled: true,
            fillColor: ColorPalette.secondaryBackground,
          ),
        );
      },
    );
  }
}
