// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../../../../settings/theme.dart';
import '../widgets/appbar_sales.dart';
import '../widgets/btn_add_product.dart';
import '../widgets/btn_save_sale.dart';
import '../widgets/iconbutton_return.dart';
import '../widgets/lbl_results_form.dart';
import '../widgets/listview_products.dart';
import '../widgets/txt_form.dart';

class SaleForm extends StatelessWidget {
  final String timePick;
  final String saleID;
  final String vendor;

  const SaleForm(
      {super.key,
      required this.timePick,
      required this.saleID,
      required this.vendor});

  @override
  Widget build(BuildContext context) {
    const String TITLE = 'Formulario de venta';

    return Scaffold(
      backgroundColor: ColorPalette.primaryBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarSales(title: TITLE, iconButton: IconButtonReturn()),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: TxtForm(),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(timePick, style: Typo.labelText1),
                Text(saleID, style: Typo.labelText1)
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: BtnAddProduct()),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Builder(
                builder: (context) {
                  return const ListviewProducts(
                    shoppingCart: [],
                  );
                },
              ),
            ),
          ),
          const LblResultsForm(
              resultPrice: '', resultQuantity: '', resultWeight: ''),
          const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 16, 8, 8),
              child: BtnSaveSale()),
        ],
      ),
    );
  }
}
