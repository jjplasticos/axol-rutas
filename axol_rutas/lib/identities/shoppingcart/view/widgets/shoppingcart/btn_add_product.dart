import 'package:axol_rutas/identities/shoppingcart/cubit/shoppingcart_cubit.dart';
import 'package:axol_rutas/identities/product/repository/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../settings/theme.dart';
import '../../../model/shoppingcart_item.dart';
import '../../views/product_fider_view.dart';

class BtnAddProduct extends StatelessWidget {
  const BtnAddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    List<ShoppingcartItemModel> shoppingcart;
    return ElevatedButton(
      onPressed: () async {
        shoppingcart = context.read<ShoppingcartCubit>().state;
        showModalBottomSheet(
          isDismissible: false,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: ProdctFinderView(
                shoppingcart: shoppingcart,
              ),
            );
          },
        ).then((value) {
          context.read<ShoppingcartCubit>().returnShoppingcart(value);
        });
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorPalette.tertiary,
          minimumSize: const Size(180, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      child: const Icon(
        Icons.add_shopping_cart,
        size: 30,
        color: ColorPalette.primaryText,
      ),
    );
  }
}
