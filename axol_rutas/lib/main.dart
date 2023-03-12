// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:axol_rutas/identities/user/view/screens/login_view.dart';
import 'package:axol_rutas/views/splash_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Axol Rutas',
      home: SplashView(),
    );
  }
}
