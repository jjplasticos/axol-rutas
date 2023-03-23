import 'package:axol_rutas/settings/theme.dart';
import 'package:flutter/material.dart';

class TextFieldPassWord extends StatefulWidget {
  const TextFieldPassWord({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldUser createState() => _TextFieldUser();
}

class _TextFieldUser extends State<TextFieldPassWord> {
  final _passWordController = TextEditingController();

  @override
  void dispose() {
    _passWordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24, 8, 24, 8),
      child: TextFormField(
        controller: _passWordController,
        //obscureText: obs,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: 'Contraseña',
          hintStyle: Typo.hintText,
          /*suffixIcon: IconButton(
            //icon: setIconEye(obs),
            /*onPressed: () {
              setState(() {
                obs == false ? obs = true : obs = false;
              });
            },*/
          ),*/
          filled: true,
          fillColor: ColorPalette.secondaryBackground,
        ),
      ),
    );
  }
}
