// ignore_for_file: constant_identifier_names

import 'package:axol_rutas/identities/sale/model/sale_model.dart';
import 'package:flutter/material.dart';

import '../../../../globals/global_widgets/appbar/appbar_global.dart';
import '../../../../globals/global_widgets/appbar/iconbutton_return.dart';
import '../../../../settings/theme.dart';
import '../../../shoppingcart/view/widgets/shoppingcart/lbl_results_form.dart';
import '../controllers/options_edit_sale_controller.dart';
import '../widgets/sale_detail/labels_sale_details.dart';
import '../widgets/sale_detail/listview_saledetail.dart';

class SaleDetailsView extends StatelessWidget {
  final SaleModel sale;
  final bool? isLoading;
  //final List<ShoppingcartItemModel> shppc;

  const SaleDetailsView({super.key, required this.sale, this.isLoading});

  @override
  Widget build(BuildContext context) {
    const String TITLE = 'Detalles de venta';
    return Scaffold(
      backgroundColor: ColorPalette.primaryBackground,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarGlobal(
          title: TITLE,
          iconButton: IconButtonReturn(
            iconName: 'return',
          ),
          //iconActions: ['1//${sale.uid}']
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Visibility(
            visible: isLoading ?? false,
            replacement: const SizedBox(height: 4),
            child: const LinearProgressIndicator(
              color: ColorPalette.primary,
              backgroundColor: ColorPalette.secondaryBackground,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
            child: LabelsSaleDetails(
              dateTime: sale.time,
              uid: sale.uid,
              location: sale.location,
              custumer: sale.client,
            ),
          ),
          Expanded(
            child: Column(children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: ListviewSaleDetail(
                      isLoading: isLoading,
                      sale: sale,
                    )),
              ),
              LblResultsForm(
                  resultPrice: sale.totalPrice,
                  resultQuantity: sale.totalQuantity,
                  resultWeight: sale.totalWeight),
            ]),
            //ListviewShoppingcartController(),
          ),
          /*Expanded(
              child: ListViewSaeleDetailsController(sale: sale),
            ),*/
          const OptionsEditSaleController(),
        ],
      ),
    );
  }
}
