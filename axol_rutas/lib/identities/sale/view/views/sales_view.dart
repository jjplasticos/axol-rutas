import 'package:axol_rutas/identities/sale/cubit/saleslist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global_widgets/appbar_global.dart';
import '../../../../settings/theme.dart';
import '../../cubit/saleslist_cubit.dart';
import '../widgets/sales_widget/fabutton_add_sale.dart';

class SalesView extends StatelessWidget {
  const SalesView({super.key});

  @override
  Widget build(BuildContext context) {
    const String TITLE = 'Ventas';

    return BlocProvider<SalesListCubit>(
      create: (_) => SalesListCubit(),
      child: Scaffold(
        backgroundColor: ColorPalette.primaryBackground,
        floatingActionButton: const FABtnAddSale(),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarGlobal(title: TITLE, iconButton: null),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: const [Expanded(child: SaleController())],
        ),
      ),
    );
  }
}
