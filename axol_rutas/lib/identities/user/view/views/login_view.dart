import 'dart:js';

import 'package:axol_rutas/identities/user/cubit/login/login/login_cubit.dart';
import 'package:axol_rutas/identities/user/cubit/login/login/login_state.dart';
import 'package:axol_rutas/identities/user/view/widgets/button_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/login/login/login_controller.dart';

import '../../../../settings/theme.dart';
import '../widgets/logo.dart';
import '../widgets/text_field_password.dart';
import '../widgets/text_field_user.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    String textPassword = 'hola';
    String textUser = 'mundo';

    return Scaffold(
        backgroundColor: ColorPalette.primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            SizedBox(
              width: double.infinity,
              height: 210,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 8),
                    child: TextFieldUser(textUser: textUser),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 8),
                    child: TextFieldPassword(
                      textPassword: textPassword,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                    child: ButtonLogin(
                      password: textPassword,
                      user: textUser,
                    ),
                  ),
                  LoginController(),
                ],
              ),
            )
          ],
        ));
  }
}
