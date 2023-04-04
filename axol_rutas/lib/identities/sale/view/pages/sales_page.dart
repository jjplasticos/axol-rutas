import 'package:axol_rutas/identities/sale/cubit/saleslist_cubit.dart';
import 'package:axol_rutas/identities/sale/view/views/sales_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SalesListCubit(),
      child: const SalesView(),
    );
  }
}
