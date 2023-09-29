// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:axol_rutas/identities/shoppingcart/cubit/shoppingcart/shppc_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../globals/global_widgets/appbar/appbar_global.dart';
import '../../../../globals/global_widgets/appbar/iconbutton_return.dart';
import '../../../../settings/theme.dart';
import '../../../sale/model/sale_type_model.dart';
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
    List<PopupMenuEntry> menuEntryList = [];
    PopupMenuItem menuItem;

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
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Visibility(
              visible: isLoading,
              replacement: const SizedBox(height: 4),
              child: const LinearProgressIndicator(
                color: ColorPalette.primary,
                backgroundColor: ColorPalette.secondaryBackground,
              )),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: BtnCustomerName(
              customer: customer,
              isLoading: isLoading,
            ),
          ),
          //Para version 0.2.0:
          //Seleccionador de tipo de venta.
          Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                  color: ColorPalette.secondaryBackground,
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      shppcView.saleType,
                      style: Typo.bodyText1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: PopupMenuButton(
                      onSelected: (value) {
                        if (value is SaleTypeModel) {
                          context.read<ShppcCubit>().changeSaleType(value.type);
                          context.read<ShppcViewCubit>().load();
                        }
                      },
                      itemBuilder: (context) {
                        menuEntryList = [];
                        for (var element in shppcView.saleTypeList) {
                          menuItem = PopupMenuItem(
                            value: element,
                            child: Text(element.type),
                          );
                          menuEntryList.add(menuItem);
                        }
                        return menuEntryList;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    '${time.day}/${time.month}/${time.year} ${time.hour}:${time.minute}',
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
