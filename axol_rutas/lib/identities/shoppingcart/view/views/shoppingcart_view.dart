// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global_widgets/appbar/appbar_global.dart';
import '../../../../global_widgets/appbar/iconbutton_return.dart';
import '../../../../settings/theme.dart';
import '../../cubit/customer_select/custselc_cubit/custselec_cubit.dart';
import '../../cubit/product_finder/product_finder_cubit.dart';
import '../../cubit/save_shoppingcart/save_shoppingcart_cubit.dart';
import '../../cubit/shoppingcart_cubit.dart';
import '../../cubit/shoppingcart_txt_cubit.dart';
import '../controllers/btn_save_shoppingcart_controller.dart';
import '../controllers/listview_shoppingcart_controller.dart';
import '../widgets/shoppingcart/btn_add_product.dart';
import '../widgets/shoppingcart/btn_save_sale.dart';
import '../widgets/shoppingcart/txt_customer_name.dart';

class ShoppingCartView extends StatelessWidget {
  final String customerName;
  const ShoppingCartView({super.key, required this.customerName});

  @override
  Widget build(BuildContext context) {
    const String TITLE = 'Formulario de venta';
    final String timePick = DateTime.now().toString();

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ProductFinderCubit()),
          BlocProvider(create: (_) => ShoppingcartCubit()),
          BlocProvider(create: (_) => TxtCustomerNameCubit()),
          BlocProvider(create: (_) => SaveShoppingcartCubit()),
        ],
        child: Scaffold(
          backgroundColor: ColorPalette.primaryBackground,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarGlobal(
              title: TITLE,
              iconButton: IconButtonReturn(
                iconName: 'return',
              ),
              iconActions: [],
            ),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: TxtCustomerName(customer: customerName),
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
                child: ListviewShoppingcartController(),
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 16, 8, 8),
                  child: BtnSaveSale(timePick: timePick)),
              const BtnSaveShoppingcartController(),
            ],
          ),
        ));
  }
}
