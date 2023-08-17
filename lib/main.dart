import 'package:axol_rutas/identities/user/view/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'identities/user/view/pages/auth_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://fwxcwrgczapfadugjmfb.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ3eGN3cmdjemFwZmFkdWdqbWZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzYxNDYzNzQsImV4cCI6MTk5MTcyMjM3NH0.InQYFRQ9gFi3Zcs81FwSi6fdMK6j2kMx08xsflffG8o',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Axol Rutas',
      home: const AuthPage(),
      routes: {
        '/AuthPage': (context) => const AuthPage(),
        //'/HomePage': (context) => HomePage(user: context.read()),
        '/LoginPage': (context) => const LoginPage(),
      },
    );
  }
}
