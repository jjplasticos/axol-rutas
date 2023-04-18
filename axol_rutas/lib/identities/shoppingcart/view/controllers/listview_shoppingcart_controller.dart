import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/shoppingcart_cubit.dart';
import '../../model/shoppingcart_item.dart';
import '../widgets/shoppingcart/lbl_results_form.dart';
import '../widgets/shoppingcart/listview_shoppingcart.dart';

class ListviewShoppingcartController extends StatelessWidget {
  const ListviewShoppingcartController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingcartCubit, List<ShoppingcartItemModel>>(
        bloc: context.read<ShoppingcartCubit>(),
        builder: (context, shoppingcart) {
          double totalPrice = 0;
          double totalQuantity = 0;
          double totalWeight = 0;
          for (var element in shoppingcart) {
            totalPrice = totalPrice + (element.price * element.quantity);
            totalQuantity = totalQuantity + element.quantity;
            totalWeight = totalWeight +
                (element.quantity * double.parse(element.product.weight));
          }
          return Column(children: [
            Expanded(
              child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: ListviewShoppingcart(
                    shoppingCart: shoppingcart,
                  )),
            ),
            LblResultsForm(
                resultPrice: totalPrice.toString(),
                resultQuantity: totalQuantity.toString(),
                resultWeight: totalWeight.toString()),
          ]);
          /*ListviewShoppingcart(
            shoppingCart: shoppingcart,
          );*/
        });
  }
}
