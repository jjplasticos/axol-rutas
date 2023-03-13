import 'package:flutter/material.dart';
import 'package:axol_rutas/settings/theme.dart';
import 'package:axol_rutas/views/logup_view.dart';
import 'package:axol_rutas/views/sales_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth_bloc.dart';
import '../../repository/data.dart';
import '../widgets/logo.dart';
import '../widgets/text_field_user.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  /*@override
  _LoginViewState createState() => _LoginViewState();*/

  @override
  Widget build(BuildContext context) {
    Data dato = Data();
    return BlocProvider(
        create: (context) => AuthBloc(data: dato, child: Container));
  }
}

/*class _LoginViewState extends State<LoginView> {
  final supabase = Supabase.instance.client;
  bool obs = true;
  final _userController = TextEditingController();
  final _passWordController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    _passWordController.dispose();
    super.dispose();
  }

  Icon setIconEye(bool obs) {
    if (obs == true) {
      return Icon(Icons.visibility_off);
    } else {
      return Icon(Icons.visibility);
    }
  }

  void _login(String user, String password) async {
    String message = '';
    final pref = await SharedPreferences.getInstance();
    final userData = await supabase
        .from('users')
        .select<List<Map<String, dynamic>>>('user_name, password, rol')
        .eq('user_name', user);
    if (userData.isNotEmpty) {
      if (userData.first['password'] == password) {
        await pref.setString('user', userData.first['user_name']);
        await pref.setString('rol', userData.first['rol']);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SalesView()));
      } else {
        message = 'Contraseña incorrecta';
      }
    } else {
      message = 'Usuario incorrecto';
    }

    if (message != '') {
      final snackBar = SnackBar(content: Text(message));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

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
                          MaterialPageRoute(builder: (context) => LogupView()));
                    },
                    child: Text(
                      'Registrar',
                      style: Typo.labelText1,
                    )),
              ],
            ),
            Logo(
              width: 250,
              height: 250,
            ),
            Container(
              width: double.infinity,
              height: 210,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextFieldUser(),
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
                        Login newLogin = Login();
                        //newLogin.setLogin();
                        _login(_userController.text, _passWordController.text);
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
}*/