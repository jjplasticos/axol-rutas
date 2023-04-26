import 'package:axol_rutas/identities/sale/model/sale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shoppingcart/cubit/shoppingcart_cubit.dart';
import '../../../shoppingcart/model/shoppingcart_models.dart';
import '../../../shoppingcart/view/widgets/shoppingcart/lbl_results_form.dart';
import '../../../shoppingcart/view/widgets/shoppingcart/listview_shoppingcart.dart';

class ListViewSaeleDetailsController extends StatelessWidget {
  final SaleModel sale;

  const ListViewSaeleDetailsController({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingcartCubit, ShoppingcartResultsModel>(
        bloc: context.read<ShoppingcartCubit>()..saleToShoppingcart(sale),
        builder: (context, state) {
          return Column(children: [
            Expanded(
              child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: ListviewShoppingcart(
                    shoppingCart: state.shoppingcart,
                  )),
            ),
            LblResultsForm(
                resultPrice: state.totalPrice.toString(),
                resultQuantity: state.totalQuantity.toString(),
                resultWeight: state.totalWeight.toString()),
          ]);
        });
  }
}
