import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/theme.dart';
import '../../../cubit/shoppingcart_txt_cubit.dart';

class TextFieldQuantity extends StatelessWidget {
  const TextFieldQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      obscureText: false,
      onChanged: (value) {
        context.read<TxtQuantityCubit>().change(value);
      },
      decoration: InputDecoration(
          hintText: 'Cantidad',
          hintStyle: Typo.hintText,
          enabledBorder:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: ColorPalette.secondaryBackground),
      style: Typo.textField1,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('\\d*\\.?\\d*'))
      ],
    );
  }
}
