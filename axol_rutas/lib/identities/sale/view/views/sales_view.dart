import 'package:flutter/material.dart';

import '../../../../settings/theme.dart';
import '../widgets/appbar_sales.dart';
import '../widgets/fabutton_add_sale.dart';

class SalesView extends StatelessWidget {
  const SalesView({super.key});

  @override
  Widget build(BuildContext context) {
    const String TITLE = 'Ventas';

    return Scaffold(
      backgroundColor: ColorPalette.primaryBackground,
      floatingActionButton: const FABtnAddSale(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBarSales(title: TITLE),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: const [],
      ),
    );
  }
}
