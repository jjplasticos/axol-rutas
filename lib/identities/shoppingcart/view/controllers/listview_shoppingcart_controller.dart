import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/shoppingcart_cubit.dart';
import '../../model/shoppingcart_models.dart';
import '../widgets/shoppingcart/lbl_results_form.dart';
import '../widgets/shoppingcart/listview_shoppingcart.dart';

class ListviewShoppingcartController extends StatelessWidget {
  const ListviewShoppingcartController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingcartCubit, ShoppingcartResultsModel>(
        bloc: context.read<ShoppingcartCubit>(),
        builder: (context, state) {
          return Column(children: [
            Expanded(
              child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: ListviewShoppingcart(
                    shoppingCart: state.shoppingcart,
                    isIconEditVisible: true,
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
