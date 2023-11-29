// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:axol_rutas/identities/user/view/widgets/button_login.dart';
import 'package:flutter/material.dart';
import '../../../../settings/theme.dart';
import '../widgets/logo.dart';
import '../widgets/text_field_password.dart';
import '../widgets/text_field_user.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.primaryBackground,
        body: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Logo(),
                SizedBox(
                  width: double.infinity,
                  height: 210,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 8),
                        child: TextFieldUser(),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 8),
                        child: TextFieldPassword(),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                        child: ButtonLogin(),
                      ),
                    ],
                  ),
                ),
              ],
            )),
            /*Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.read<LoginCubit>().test(0);
                  },
                  icon: Icon(Icons.science_rounded, color: ColorPalette.secondaryBackground),
                )
              ],
            )*/
          ],
        ));
  }
}
