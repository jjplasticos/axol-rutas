// ignore_for_file: use_build_context_synchronously

import 'package:axol_rutas/identities/user/view/screens/login_view.dart';
import 'package:axol_rutas/views/sales_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    final pref = await SharedPreferences.getInstance();
    final session = pref.getString('user');

    if (session == null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginView()));
    } else {
      final userData = await supabase
          .from('users')
          .select<List<Map<String, dynamic>>>('user_name, rol')
          .eq('user_name', session);
      if (userData.isNotEmpty) {
        await pref.setString('user', userData.first['user_name']);
        await pref.setString('rol', userData.first['rol']);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SalesView()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
