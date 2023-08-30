import 'package:axol_rutas/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/login/login/login_cubit.dart';
import '../../cubit/login/login_form_cubit.dart';
import '../../model/login_form_model.dart';

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    FocusNode focusNode = FocusNode();
    LoginFormModel form = context.read<LoginFormCubit>().state;
    controller.value = TextEditingValue(
        text: form.password.value,
        selection: TextSelection.collapsed(offset: form.password.position));
    int focus = form.focus;
    if (focus == 1) {
      focusNode.requestFocus();
    }
    bool obs = form.obs;

    return TextField(
      cursorColor: ColorPalette.primary,
      focusNode: focusNode,
      controller: controller,
      obscureText: obs,
      onChanged: (value) {
        context.read<LoginFormCubit>().changeTextfield(
              1,
              value,
              controller.selection.base.offset,
            );
      },
      onSubmitted: (value) {
        context.read<LoginFormCubit>().changeTextfield(
              1,
              value,
              controller.selection.base.offset,
            );
        context.read<LoginFormCubit>().changeFocus(2);
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
        hintText: 'Contraseña',
        hintStyle: Typo.hintText,
        suffixIconColor: ColorPalette.primary,
        suffixIcon: IconButton(
          icon: obs
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          onPressed: () {
            context.read<LoginFormCubit>().changeTextfield(
                  1,
                  controller.text,
                  controller.selection.base.offset,
                );
            context.read<LoginFormCubit>().changeVisible(obs);
            context.read<LoginCubit>().load();
          },
        ),
        filled: true,
        fillColor: ColorPalette.secondaryBackground,
      ),
    );
  }
}
