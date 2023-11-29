import 'package:axol_rutas/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/login/login/login_cubit.dart';
import '../../cubit/login/login_form_cubit.dart';
import '../../model/login_form_model.dart';

class TextFieldUser extends StatelessWidget {
  const TextFieldUser({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    FocusNode focusNode = FocusNode();
    LoginFormModel form = context.read<LoginFormCubit>().state;
    controller.value = TextEditingValue(
        text: form.userName.value,
        selection: TextSelection.collapsed(offset: form.userName.position));
    int focus = form.focus;
    if (focus == 0) {
      focusNode.requestFocus();
    }
    return TextField(
      cursorColor: ColorPalette.primary,
      focusNode: focusNode,
      onChanged: (value) {
        context.read<LoginFormCubit>().changeTextfield(
              0,
              value,
              controller.selection.base.offset,
            );
      },
      onSubmitted: (value) {
        context.read<LoginFormCubit>().changeTextfield(
              0,
              value,
              controller.selection.base.offset,
            );
        context.read<LoginFormCubit>().changeFocus(1);
        context.read<LoginCubit>().load();
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorPalette.primary),
          borderRadius: BorderRadius.circular(12),
          ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorPalette.primary),
          borderRadius: BorderRadius.circular(12),
          ),
        hintText: 'Usuario',
        hintStyle: Typo.hintText,
        filled: true,
        fillColor: ColorPalette.secondaryBackground,
      ),
    );
  }
}
