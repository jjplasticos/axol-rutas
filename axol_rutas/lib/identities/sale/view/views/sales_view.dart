import 'package:axol_rutas/identities/sale/cubit/salesList_controller.dart';
import 'package:flutter/material.dart';

import '../../../../global_widgets/appbar_global.dart';
import '../../../../settings/theme.dart';
import '../widgets/sales_widget/fabutton_add_sale.dart';

class SalesView extends StatelessWidget {
  const SalesView({super.key});

  @override
  Widget build(BuildContext context) {
    const String TITLE = 'Ventas';

    return Scaffold(
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
    );
  }
}
