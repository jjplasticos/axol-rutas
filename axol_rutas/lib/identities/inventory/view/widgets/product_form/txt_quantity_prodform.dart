import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../settings/theme.dart';

class TextFieldQuantity extends StatelessWidget {
  const TextFieldQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //controller: _quantityController,
      autofocus: false,
      obscureText: false,
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
