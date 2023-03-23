import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'identities/sale/view/screens/sales_page.dart';
import 'identities/user/view/pages/auth_page.dart';
import 'identities/user/view/views/login_page2.dart';

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
      home: AuthPage(),
      routes: {
        //'/SplashPage': (context) => SplashPage(),
        '/LoginPage': (context) => LoginPage2(),
        '/SalesPage': (context) => SalesPage(),
      },
    );
  }
}
