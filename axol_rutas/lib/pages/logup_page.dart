// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:axol_rutas/supaBase.dart';
import 'package:flutter/material.dart';
import 'package:axol_rutas/theme/theme.dart';
import 'package:axol_rutas/pages/logup_page.dart';

final _userController = TextEditingController();
final _passWordController = TextEditingController();

@override
void dispose() {
  _userController.dispose();
  _passWordController.dispose();
  //dispose();
}

class LogupPage extends StatefulWidget {
  const LogupPage({super.key});

  @override
  _LogupPageState createState() => _LogupPageState();
}

class _LogupPageState extends State<LogupPage> {
  final _supabaseClient = SupaAuth();

  bool obs = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 210,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    //---------------------Text field user--------------
                    padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 8),
                    child: TextFormField(
                      controller: _userController,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Correo',
                        hintStyle: Typo.hintText,
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        filled: true,
                        fillColor: ColorPalette.secondaryBackground,
                      ),
                    ),
                  ),
                  Padding(
                    //---------------------Text field email--------------
                    padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 8),
                    child: TextFormField(
                      controller: _passWordController,
                      obscureText: obs,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Contraseña',
                        hintStyle: Typo.hintText,
                        suffixIcon: IconButton(
                          icon: setIconEye(obs),
                          onPressed: () {
                            setState(() {
                              obs == false ? obs = true : obs = false;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: ColorPalette.secondaryBackground,
                      ),
                    ),
                  ),
                  Padding(
                    //---------------------Button Iniciar----------------
                    padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        _supabaseClient.singUpUser(context,
                            email: _userController.text,
                            password: _passWordController.text);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Registrar',
                        style: Typo.textButton,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

Icon setIconEye(bool obs) {
  if (obs == true) {
    return Icon(Icons.visibility_off);
  } else {
    return Icon(Icons.visibility);
  }
}
