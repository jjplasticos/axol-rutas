// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../../../../global_widgets/appbar_global.dart';
import '../../../../global_widgets/iconbutton_select.dart';
import '../../../../settings/theme.dart';
import '../../cubit/lists_products/lists_products_controller.dart';
import '../widgets/sale_form/btn_add_product.dart';
import '../widgets/sale_form/btn_save_sale.dart';
import '../widgets/sale_form/lbl_results_form.dart';
import '../widgets/sale_form/txt_form.dart';

class SaleForm extends StatelessWidget {
  final String timePick;

  const SaleForm({super.key, required this.timePick});

  @override
  Widget build(BuildContext context) {
    const String TITLE = 'Formulario de venta';

    return Scaffold(
      backgroundColor: ColorPalette.primaryBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarGlobal(
            title: TITLE,
            iconButton: IconButtonSelect(
              iconName: 'return',
            )),
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
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: BtnAddProduct()),
          const Expanded(
            child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: ProductsShoppingcartController()),
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
