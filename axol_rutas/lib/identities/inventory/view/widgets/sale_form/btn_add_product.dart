import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../settings/theme.dart';
import '../../../cubit/nav_shoppingcart/nav_shoppingcart_controller.dart';
import '../../../cubit/nav_shoppingcart/nav_shoppingcart_cubit.dart';

class BtnAddProduct extends StatelessWidget {
  const BtnAddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        onPressed: () async {
          context.read<NavShoppingcartCubit>().pressBtnShoppingcart();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorPalette.tertiary,
            minimumSize: const Size(180, 60),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: const Icon(
          Icons.add_shopping_cart,
          size: 30,
          color: ColorPalette.primaryText,
        ),
      ),
      const BtnShoppingcartController(),
    ]);
  }
}
