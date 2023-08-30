import 'package:axol_rutas/identities/user/cubit/login/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global_models/textfield_form_model.dart';
import '../../../../settings/theme.dart';
import '../../cubit/login/login_form_cubit.dart';
import '../../model/login_form_model.dart';

class TextfieldLogin extends StatelessWidget {
  final String label;
  final List<TextInputFormatter>? inputFormatter;
  final int keyFormElement;
  final bool? isFocus;
  final double? width;
  final bool isLoading;

  const TextfieldLogin({
    super.key,
    required this.label,
    this.inputFormatter,
    required this.keyFormElement,
    this.isFocus,
    this.width,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    FocusNode focusNode = FocusNode();
    LoginFormModel form = context.read<LoginFormCubit>().state;
    TextfieldFormModel textfieldForm = TextfieldFormModel.initial();
    int nextFocus = keyFormElement + 1;
    if (keyFormElement == 0) {
      textfieldForm = form.userName;
    } else if (keyFormElement == 1) {
      textfieldForm = form.password;
    } 

    textController.value = TextEditingValue(
        text: textfieldForm.value,
        selection: TextSelection.collapsed(offset: textfieldForm.position));
    if (isFocus ?? false) {
      focusNode.requestFocus();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Typo.bodyText6,),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: SizedBox(
              height: 40,
              width: width ?? double.infinity,
              child: TextField(
                enabled: !isLoading,
                inputFormatters: inputFormatter,
                focusNode: focusNode,
                controller: textController,
                decoration: InputDecoration(
                  isDense: true,
                  errorStyle: const TextStyle(height: 0.3),
                  errorText: textfieldForm.validation.isValid
                      ? null
                      : textfieldForm.validation.errorMessage,
                  errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ),
                onSubmitted: (value) {
                  context.read<LoginFormCubit>().changeTextfield(
                        keyFormElement,
                        value,
                        textController.selection.base.offset,
                      );
                  context.read<LoginFormCubit>().changeFocus(nextFocus);
                  context.read<LoginCubit>().load();
                },
                onChanged: (value) {
                  context.read<LoginFormCubit>().changeTextfield(
                        keyFormElement,
                        value,
                        textController.selection.base.offset,
                      );
                },
              )),
        ),
      ],
    );
  }
}