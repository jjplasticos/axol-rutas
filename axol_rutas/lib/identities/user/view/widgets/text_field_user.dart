import 'package:axol_rutas/settings/theme.dart';
import 'package:flutter/material.dart';

class TextFieldUser extends StatefulWidget {
  const TextFieldUser({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldUser createState() => _TextFieldUser();
}

class _TextFieldUser extends State<TextFieldUser> {
  final _userController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24, 8, 24, 8),
      child: TextFormField(
        controller: _userController,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Usuario',
          hintStyle: Typo.hintText,
          border: UnderlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: ColorPalette.secondaryBackground,
        ),
      ),
    );
  }
}
