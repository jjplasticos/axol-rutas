import 'package:axol_rutas/identities/user/cubit/login/login_cubit.dart';
import 'package:axol_rutas/identities/user/cubit/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/login/login_controller.dart';

import '../../../../settings/theme.dart';
import '../widgets/logo.dart';
import '../widgets/text_field_user.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginView createState() => _LoginView();
}

class _LoginView extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(
              width: 250,
              height: 250,
            ),
            SizedBox(
              width: double.infinity,
              height: 210,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextFieldUser(),
                  Text('TextFieldPassword'),
                  Padding(
                    //---------------------Button Iniciar----------------
                    padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 58),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () async {
                        LoginController().login(context, 'user', 'passwprd');
                      },
                      child: const Text(
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
