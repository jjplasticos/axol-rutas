import 'package:axol_rutas/identities/product/model/product.dart';
import 'package:axol_rutas/identities/shoppingcart/cubit/shoppingcart_cubit.dart';
import 'package:axol_rutas/settings/jsonList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/theme.dart';
import '../../../cubit/shoppingcart_txt_cubit.dart';
import '../../../model/shoppingcart_item.dart';

class ButtonSaveProdform extends StatelessWidget {
  final ProductModel product;
  final List<ShoppingcartItemModel> shoppingcart;
  final double stock;

  const ButtonSaveProdform(
      {super.key,
      required this.product,
      required this.shoppingcart,
      required this.stock});

  @override
  Widget build(BuildContext context) {
    String quantity;
    String price;
    ShoppingcartItemModel shoppingcartItem;

    return ElevatedButton(
      onPressed: () async {
        quantity = context.read<TxtQuantityCubit>().state;
        price = context.read<TxtPriceCubit>().state;
        if (double.parse(quantity) <= stock) {
          shoppingcartItem = ShoppingcartItemModel(
              product: product,
              quantity: double.parse(quantity),
              price: double.parse(price));
          shoppingcart.add(shoppingcartItem);
          Navigator.pop(context);
          Navigator.pop(context, shoppingcart);
        } else {}
      },
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(190, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: ColorPalette.primary),
      child: const Text(
        'Agregar',
        style: Typo.textButton,
      ),
    );
  }
}
