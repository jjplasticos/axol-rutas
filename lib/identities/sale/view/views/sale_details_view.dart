// ignore_for_file: constant_identifier_names

import 'package:axol_rutas/identities/sale/model/sale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global_widgets/appbar/appbar_global.dart';
import '../../../../global_widgets/appbar/iconbutton_return.dart';
import '../../../../settings/theme.dart';
import '../../../shoppingcart/cubit/shoppingcart_cubit.dart';
import '../../cubit/options_edit_sale/options_edit_sale_cubit.dart';
import '../controllers/lisview_saledetails_controller.dart';
import '../controllers/options_edit_sale_controller.dart';
import '../widgets/sale_detail/labels_sale_details.dart';

class SaleDetailsView extends StatelessWidget {
  final SaleModel sale;

  const SaleDetailsView({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    const String TITLE = 'Detalles de venta';
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ShoppingcartCubit()),
        BlocProvider(create: (_) => OptionsEditSaleCubit()),
      ],
      child: Scaffold(
        backgroundColor: ColorPalette.primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarGlobal(
              title: TITLE,
              iconButton: const IconButtonReturn(
                iconName: 'return',
              ),
              iconActions: ['1//${sale.uid}']),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
              child: LabelsSaleDetails(
                time: sale.time,
                uid: sale.uid,
                location: sale.location,
                custumer: sale.client,
              ),
            ),
            Expanded(
              child: ListViewSaeleDetailsController(sale: sale),
            ),
            const OptionsEditSaleController(),
          ],
        ),
      ),
    );
  }
}
