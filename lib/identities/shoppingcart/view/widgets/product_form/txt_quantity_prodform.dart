import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../global_models/textfield_form_model.dart';
import '../../../../../settings/theme.dart';
import '../../../cubit/shppcitem_form/shppcitem_form_cubit.dart';
import '../../../cubit/shppcitem_form/shppcitem_view_cubit.dart';
import '../../../model/shppcitem_form_model.dart';

class TextFieldQuantity extends StatelessWidget {
  const TextFieldQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    //context.read<TxtQuantityCubit>().change(initialQuantity);
    TextEditingController txtController = TextEditingController();
    ShppcitemFormModel form = context.read<ShppcitemFormCubit>().state;
    TextfieldFormModel textfieldForm = form.quantity;
    txtController.value = TextEditingValue(
        text: textfieldForm.value,
        selection: TextSelection.collapsed(offset: textfieldForm.position));
    return TextField(
      cursorColor: ColorPalette.primary,
      controller: txtController,
      onChanged: (value) {
        context
            .read<ShppcitemFormCubit>()
            .changeTextfield(value, txtController.selection.base.offset, 0);
      },
      onSubmitted: (value) {
        context
            .read<ShppcitemFormCubit>()
            .changeTextfield(value, txtController.selection.base.offset, 0);
        context.read<ShppcitemViewCubit>().load();
      },
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorPalette.primary)),
        hintText: 'Cantidad',
        hintStyle: Typo.hintText,
        //border: UnderlineInputBorder(borderRadius: BorderRadius.circular(8)),
        //filled: true,
        isDense: true,
        fillColor: ColorPalette.secondaryBackground,
        errorStyle: const TextStyle(height: 0.3),
        errorText: textfieldForm.validation.isValid
            ? null
            : textfieldForm.validation.errorMessage,
        errorBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(8)),
      ),
      style: Typo.textField1,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))
      ],
    );
  }
}
