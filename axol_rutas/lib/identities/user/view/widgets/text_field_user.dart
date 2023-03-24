import 'package:axol_rutas/identities/user/cubit/login/controllers/login_txt_cubit.dart';
import 'package:axol_rutas/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldUser extends StatelessWidget {
  const TextFieldUser({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        context.read<UserTxtCubit>().change(value);
      },
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Usuario',
        hintStyle: Typo.hintText,
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: ColorPalette.secondaryBackground,
      ),
    );
  }
}
