import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../global_models/textfield_form_model.dart';
import '../../../../../settings/theme.dart';
import '../../../cubit/shppcitem_form/shppcitem_form_cubit.dart';
import '../../../cubit/shppcitem_form/shppcitem_view_cubit.dart';
import '../../../model/shppcitem_form_model.dart';

class TextFieldPrice extends StatelessWidget {
  const TextFieldPrice({super.key});

  @override
  Widget build(BuildContext context) {
    //context.read<TxtPriceCubit>().change(initialPrice);
    TextEditingController txtController = TextEditingController();
    ShppcitemFormModel form = context.read<ShppcitemFormCubit>().state;
    TextfieldFormModel textfieldForm = form.price;
    txtController.value = TextEditingValue(
        text: textfieldForm.value,
        selection: TextSelection.collapsed(offset: textfieldForm.position));
    return Container(
      decoration: BoxDecoration(
          color: ColorPalette.secondaryBackground,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 0),
            child: Text(
              '\$',
              textAlign: TextAlign.end,
              style: Typo.textField1,
            ),
          ),
          Expanded(
            child: TextField(
              controller: txtController,
              textCapitalization: TextCapitalization.none,
              onChanged: (value) {
                //context.read<TxtPriceCubit>().change(value);
                context
                    .read<ShppcitemFormCubit>()
                    .changeTextfield(value, txtController.selection.base.offset, 1);
              },
              onSubmitted:(value) {
                context
                    .read<ShppcitemFormCubit>()
                    .changeTextfield(value, txtController.selection.base.offset, 1);
                context.read<ShppcitemViewCubit>().load();
              },
              decoration: InputDecoration(
                hintText: 'Precio',
                hintStyle: Typo.hintText,
                border: const UnderlineInputBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    topRight: Radius.circular(8),
                  )),
                filled: true,
                fillColor: ColorPalette.secondaryBackground,
                isDense: true,
                errorStyle: const TextStyle(height: 0.3),
                errorText: textfieldForm.validation.isValid
                    ? null
                    : textfieldForm.validation.errorMessage,
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    topRight: Radius.circular(8),
                  )
                    ),
              ),
              style: Typo.textField1,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
