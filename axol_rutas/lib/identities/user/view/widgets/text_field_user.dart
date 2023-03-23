import 'package:axol_rutas/settings/theme.dart';
import 'package:flutter/material.dart';

class TextFieldUser extends StatelessWidget {
  String textUser;

  TextFieldUser({super.key, required this.textUser});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        textUser = value;
      },
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Usuario',
        hintStyle: Typo.hintText,
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: ColorPalette.secondaryBackground,
      ),
    );
  }
}
