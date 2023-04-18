// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global_widgets/appbar_global.dart';
import '../../../../global_widgets/iconbutton_select.dart';
import '../../../../settings/theme.dart';
import '../../cubit/product_finder/product_finder_cubit.dart';
import '../../cubit/shoppingcart_cubit.dart';
import '../../cubit/shoppingcart_txt_cubit.dart';
import '../controllers/listview_shoppingcart_controller.dart';
import '../widgets/shoppingcart/btn_add_product.dart';
import '../widgets/shoppingcart/btn_save_sale.dart';
import '../widgets/shoppingcart/lbl_results_form.dart';
import '../widgets/shoppingcart/txt_customer_name.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    const String TITLE = 'Formulario de venta';
    final String timePick = DateTime.now().toString();

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ProductFinderCubit()),
          BlocProvider(create: (_) => ShoppingcartCubit()),
          BlocProvider(create: (_) => TxtCustomerNameCubit()),
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
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: TxtCustomerName(),
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
              const ListviewShoppingcartController(),
              /*const Expanded(
                child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: ListviewShoppingcartController()),
              ),
              const LblResultsForm(
                  resultPrice: '', resultQuantity: '', resultWeight: ''),*/
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 16, 8, 8),
                  child: BtnSaveSale(
                    timePick: timePick,
                    shoppingcart: context.read<ShoppingcartCubit>().state,
                  )),
            ],
          ),
        ));
  }
}
