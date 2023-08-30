import 'package:axol_rutas/identities/shoppingcart/cubit/customer_form/customer_formview_cubit.dart';
import 'package:axol_rutas/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../global_models/textfield_form_model.dart';
import '../../../cubit/customer_form/customer_form_cubit.dart';
import '../../../model/addcustomer_form_model.dart';

class TextfieldCustomer extends StatelessWidget {
  final String label;
  final List<TextInputFormatter>? inputFormatter;
  final int keyFormElement;
  final bool? isFocus;
  final double? width;
  final bool isLoading;

  const TextfieldCustomer({
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
    AddcustomerFormModel form = context.read<CustomerFormCubit>().state;
    TextfieldFormModel textfieldForm = TextfieldFormModel.initial();
    int nextFocus = keyFormElement + 1;
    if (keyFormElement == 0) {
      textfieldForm = form.name;
    } else if (keyFormElement == 1) {
      textfieldForm = form.address;
    } else if (keyFormElement == 2) {
      textfieldForm = form.hood;
    } else if (keyFormElement == 3) {
      textfieldForm = form.town;
    } else if (keyFormElement == 4) {
      textfieldForm = form.country;
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
                cursorColor: ColorPalette.primary,
                enabled: !isLoading,
                inputFormatters: inputFormatter,
                focusNode: focusNode,
                controller: textController,
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.primary)),
                  isDense: true,
                  errorStyle: const TextStyle(height: 0.3),
                  errorText: textfieldForm.validation.isValid
                      ? null
                      : textfieldForm.validation.errorMessage,
                  errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ),
                onSubmitted: (value) {
                  context.read<CustomerFormCubit>().changeTextfield(
                        keyFormElement,
                        value,
                        textController.selection.base.offset,
                      );
                  context.read<CustomerFormCubit>().changeFocus(nextFocus);
                  context.read<CustomerFormviewCubit>().load();
                },
                onChanged: (value) {
                  context.read<CustomerFormCubit>().changeTextfield(
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
