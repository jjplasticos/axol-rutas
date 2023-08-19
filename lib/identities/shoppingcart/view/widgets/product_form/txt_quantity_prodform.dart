import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../global_models/textfield_form_model.dart';
import '../../../../../settings/theme.dart';
import '../../../cubit/shoppingcart_txt_cubit.dart';
import '../../../cubit/shppcitem_form/shppcitem_form_cubit.dart';
import '../../../model/shppcitem_form_model.dart';

class TextFieldQuantity extends StatelessWidget {
  final String initialQuantity;

  const TextFieldQuantity({super.key, required this.initialQuantity});

  @override
  Widget build(BuildContext context) {
    //context.read<TxtQuantityCubit>().change(initialQuantity);
    TextEditingController txtController = TextEditingController();
    ShppcitemFormModel form = context.read<ShppcitemFormCubit>().state;
    TextfieldFormModel textfieldForm = form.quantity;
    txtController.value = TextEditingValue(
        text: textfieldForm.value,
        selection: TextSelection.collapsed(offset: textfieldForm.position));
    return TextFormField(
      initialValue: initialQuantity,
      autofocus: false,
      obscureText: false,
      onChanged: (value) {
        //context.read<TxtQuantityCubit>().change(value);
        context
            .read<ShppcitemFormCubit>()
            .change(value, txtController.selection.base.offset, 0);
      },
      decoration: InputDecoration(
        hintText: 'Cantidad *en prueba*',
        hintStyle: Typo.hintText,
        enabledBorder:
            UnderlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        isDense: true,
        fillColor: ColorPalette.secondaryBackground,
        errorStyle: const TextStyle(height: 0.3),
        errorText: textfieldForm.validation.isValid
            ? null
            : textfieldForm.validation.errorMessage,
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red)),
      ),
      style: Typo.textField1,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))
      ],
    );
  }
}
