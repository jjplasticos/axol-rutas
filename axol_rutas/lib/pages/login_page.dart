// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:axol_rutas/settings/theme.dart';
import 'package:axol_rutas/pages/logup_page.dart';
import 'package:axol_rutas/supaBase.dart';
import 'package:axol_rutas/pages/sales_page.dart';

final _userController = TextEditingController();
final _passWordController = TextEditingController();

@override
void dispose() {
  _userController.dispose();
  _passWordController.dispose();
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LogupPage()));
                    },
                    child: Text(
                      'Registrar',
                      style: Typo.labelText1,
                    )),
              ],
            ),
            Image.asset(
              //---------------------Logo-------------------------------
              'assets/images/axolLogo.png',
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
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
                      autofocus: false,
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
                        minimumSize: Size(double.infinity, 58),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SalesPage()));
                      },
                      child: Text(
                        'Iniciar',
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
