// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global_widgets/appbar/appbar_global.dart';
import '../../../../global_widgets/appbar/iconbutton_return.dart';
import '../../../../settings/theme.dart';
import '../../cubit/shoppingcart/shppc_cubit.dart';
import '../../model/route_customer_model.dart';
import '../../model/shppc_view_model.dart';
import '../widgets/shoppingcart/btn_add_product.dart';
import '../widgets/shoppingcart/btn_save_sale.dart';
import '../widgets/shoppingcart/lbl_results_form.dart';
import '../widgets/shoppingcart/listview_shoppingcart.dart';
import '../widgets/shoppingcart/btn_customer_name.dart';

class ShoppingCartView extends StatelessWidget {
  final bool isLoading;
  const ShoppingCartView({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    const String TITLE = 'Formulario de ventas';
    final ShppcViewModel shppcView = context.read<ShppcCubit>().state;
    final RouteCustomerModel rc = shppcView.routeCustomer;
    final String customer;
    final DateTime time = shppcView.dateTime;
    if (rc.id > -1) {
      customer = '${rc.id}: ${rc.name}';
    } else {
      customer = 'Seleccione un cliente';
    }

    return Scaffold(
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
                child: BtnCustomerName(
                  customer: customer,
                  isLoading: isLoading,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${time.day}/${time.month}/${time.year} ${time.hour}:${time.minute}',
                        style: Typo.labelText1),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: BtnAddProduct(
                    isLoading: isLoading,
                  )),
              Expanded(
                child: Column(children: [
                   Expanded(
                    child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: ListviewShoppingcart(
                          isIconEditVisible: true,
                          isLoading: isLoading,
                        )),
                  ),
                  LblResultsForm(
                      resultPrice: shppcView.totalPrice.toString(),
                      resultQuantity: shppcView.totalQuantity.toString(),
                      resultWeight: shppcView.totalWeight.toString()),
                ]),
                //ListviewShoppingcartController(),
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 16, 8, 8),
                  child: BtnSaveSale(isLoading: isLoading)),
              //const BtnSaveShoppingcartController(),
            ],
          ),
        );
  }
}
