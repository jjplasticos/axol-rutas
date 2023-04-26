// ignore_for_file: constant_identifier_names

import 'package:axol_rutas/identities/sale/model/sale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global_widgets/appbar_global.dart';
import '../../../../global_widgets/iconbutton_select.dart';
import '../../../../settings/theme.dart';
import '../../../shoppingcart/cubit/shoppingcart_cubit.dart';
import '../controllers/lisview_saledetails_controller.dart';

class SaleDetailsView extends StatelessWidget {
  final SaleModel sale;

  const SaleDetailsView({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    const String TITLE = 'Detalles de venta';
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ShoppingcartCubit()),
      ],
      child: Scaffold(
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
            Expanded(
              child: ListViewSaeleDetailsController(sale: sale),
            )
          ],
        ),
      ),
    );
  }
}
