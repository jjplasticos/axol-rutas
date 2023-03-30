import 'package:flutter/material.dart';

import '../../../../settings/theme.dart';

class TxtForm extends StatelessWidget {
  const TxtForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        //context.read<UserTxtCubit>().change(value);
      },
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Nombre del cliente',
        hintStyle: Typo.hintText,
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: ColorPalette.secondaryBackground,
      ),
    );
  }
}
