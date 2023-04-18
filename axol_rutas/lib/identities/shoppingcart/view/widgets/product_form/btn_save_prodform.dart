import 'package:axol_rutas/identities/product/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/theme.dart';
import '../../../cubit/save_shppc_item/save_shppc_item_cubit.dart';
import '../../../cubit/shoppingcart_txt_cubit.dart';
import '../../../model/shoppingcart_item.dart';

class ButtonSaveProdform extends StatelessWidget {
  final ProductModel product;
  final List<ShoppingcartItemModel> shoppingcart;
  final double stock;
  final int act;
  final int index;

  const ButtonSaveProdform(
      {super.key,
      required this.product,
      required this.shoppingcart,
      required this.stock,
      required this.act,
      required this.index});

  @override
  Widget build(BuildContext context) {
    String quantity;
    String price;
    return ElevatedButton(
      onPressed: () async {
        quantity = context.read<TxtQuantityCubit>().state;
        price = context.read<TxtPriceCubit>().state;
        context.read<SaveShppcItemCubit>().runVerification(
            quantity, price, stock, shoppingcart, product, index, act);
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
