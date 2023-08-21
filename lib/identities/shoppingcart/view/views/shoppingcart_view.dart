// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global_widgets/appbar/appbar_global.dart';
import '../../../../global_widgets/appbar/iconbutton_return.dart';
import '../../../../settings/theme.dart';
import '../../cubit/product_finder/product_finder_cubit.dart';
import '../../cubit/save_shoppingcart/save_shoppingcart_cubit.dart';
import '../../cubit/shoppingcart/shppc_cubit.dart';
import '../../cubit/shoppingcart_cubit.dart';
import '../../cubit/shoppingcart_txt_cubit.dart';
import '../../model/route_customer_model.dart';
import '../controllers/btn_save_shoppingcart_controller.dart';
import '../controllers/listview_shoppingcart_controller.dart';
import '../widgets/shoppingcart/btn_add_product.dart';
import '../widgets/shoppingcart/btn_save_sale.dart';
import '../widgets/shoppingcart/txt_customer_name.dart';

class ShoppingCartView extends StatelessWidget {
  final bool isLoading;
  const ShoppingCartView({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    const String TITLE = 'Formulario de ventas';
    final String timePick = DateTime.now().toString();
    final RouteCustomerModel rc = context.read<ShppcCubit>().state.routeCustomer;
    final String customer;
    if (rc.id > -1) {
      customer = '${rc.id}: ${rc.name}';
    } else {
      customer = 'Seleccione un cliente';
    }

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ProductFinderCubit()),
          BlocProvider(create: (_) => ShoppingcartCubit()),
          BlocProvider(create: (_) => TxtCustomerNameCubit()),
          BlocProvider(create: (_) => SaveShoppingcartCubit()),
        ],
        child: Scaffold(
          backgroundColor: ColorPalette.primaryBackground,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBarGlobal(
              title: TITLE,
              iconButton: IconButtonReturn(
                iconName: 'return',
                isLoading: isLoading,
              ),
              iconActions: const [],
            ),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Visibility(
                visible: isLoading,
                replacement: const SizedBox(height: 4),
                child: const LinearProgressIndicator()),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: BtnCustomerName(customer: customer, isLoading: isLoading,),
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
