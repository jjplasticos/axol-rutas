import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'identities/sale/cubit/sales_cubit/sale_form_cubit.dart';
import 'identities/sale/cubit/sales_cubit/sales_view_cubit.dart';
import 'identities/sale/view/controllers/salesview_controller.dart';
import 'identities/user/cubit/vendors_list/vendors_list_cubit.dart';
import 'identities/user/view/controller/vendorslist_controller.dart';
import 'identities/user/view/pages/auth_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://fwxcwrgczapfadugjmfb.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ3eGN3cmdjemFwZmFkdWdqbWZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzYxNDYzNzQsImV4cCI6MTk5MTcyMjM3NH0.InQYFRQ9gFi3Zcs81FwSi6fdMK6j2kMx08xsflffG8o',
  );

  await Hive.initFlutter();

  if (await Hive.boxExists('saleBox') == true) {
    if (Hive.isBoxOpen('saleBox') == false) {
      await Hive.openBox('saleBox');
    }
  } else {
    await Hive.openBox('saleBox');
  }

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
        '/SalesViewController': (context) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => SalesViewCubit()),
                BlocProvider(create: (_) => SaleFormCubit()),
              ],
              // ignore: prefer_const_constructors
              child: SalesViewController(),
            ),
          '/VendorsListController': (context) => BlocProvider(
                          create: (_) => VendorsListCubit(),
                          child: VendorsListController(),
                        )
        //'/HomePage': (context) => HomePage(user: context.read()),
        //'/LoginPage': (context) => const LoginPage(),
      },
    );
  }
}
