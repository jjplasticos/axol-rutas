import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/shoppingcart_cubit.dart';
import '../../model/shoppingcart_item.dart';
import '../widgets/shoppingcart/listview_shoppingcart.dart';

class ListviewShoppingcartController extends StatelessWidget {
  const ListviewShoppingcartController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingcartCubit, List<ShoppingcartItemModel>>(
        bloc: context.read<ShoppingcartCubit>(),
        builder: (context, shoppingcart) {
          return ListviewShoppingcart(
            shoppingCart: shoppingcart,
          );
        });
  }
}
