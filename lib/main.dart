// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'identities/inventory/cubit/inventory_form_cubit.dart';
import 'identities/inventory/cubit/inventory_view/inventory_view_cubit.dart';
import 'identities/inventory/view/controllers/inventory_controller.dart';
import 'identities/sale/cubit/options_edit_sale/options_edit_sale_cubit.dart';
import 'identities/sale/cubit/sale_detail/sale_detail_cubit.dart';
import 'identities/sale/cubit/sales_cubit/sale_form_cubit.dart';
import 'identities/sale/cubit/sales_cubit/sales_view_cubit.dart';
import 'identities/sale/cubit/sales_report/salesreport_cubit.dart';
import 'identities/sale/cubit/sales_report/srep_form_cubit.dart';
import 'identities/sale/view/controllers/sale_detail_controller.dart';
import 'identities/sale/view/controllers/sales_report_controller.dart';
import 'identities/sale/view/controllers/salesview_controller.dart';
import 'identities/shoppingcart/cubit/shoppingcart/shppc_cubit.dart';
import 'identities/shoppingcart/cubit/shoppingcart/shppc_view_cubit.dart';
import 'identities/shoppingcart/cubit/shoppingcart_view_cubit/shoppingcart_view_cubit.dart';
import 'identities/shoppingcart/view/controllers/shoppingcart_controller.dart';
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
        '/SalesViewController': (context) => MultiBlocProvider(providers: [
              BlocProvider(create: (_) => SalesViewCubit()),
              BlocProvider(create: (_) => SaleFormCubit()),
            ], child: SalesViewController()),
        '/VendorsListController': (context) => BlocProvider(
            create: (_) => VendorsListCubit(), child: VendorsListController()),
        '/InventoryController': (context) => MultiBlocProvider(providers: [
              BlocProvider(create: (_) => InventoryViewCubit()),
              BlocProvider(create: (_) => InventoryFormCubit()),
            ], child: InventoryController()),
        '/SalesReportController': (context) => MultiBlocProvider(providers: [
              BlocProvider(create: (_) => SalesReportCubit()),
              BlocProvider(create: (_) => SRepFormCubit()),
            ], child: const SalesReportController()),
        '/ShoppingcartController': (context) => MultiBlocProvider(providers: [
              BlocProvider(create: (_) => ShoppingcartViewCubit()),
              BlocProvider(create: (_) => ShppcCubit()),
              BlocProvider(create: (_) => ShppcViewCubit()),
            ], child: const ShoppingcartController()),
        '/SaleDetailController': (context) => MultiBlocProvider(providers: [
              BlocProvider(create: (_) => SaleDetailCubit()),
              BlocProvider(create: (_) => OptionsEditSaleCubit()),
            ], child: SaleDetailController())
      },
    );
  }
}
