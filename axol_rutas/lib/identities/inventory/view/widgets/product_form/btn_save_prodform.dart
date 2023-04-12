import 'package:axol_rutas/identities/product/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../settings/theme.dart';
import '../../../cubit/lists_products/lists_products_cubit.dart';
import '../../../cubit/save_products/save_products_cubit.dart';
import '../../../cubit/shoppingcart_txt_cubit.dart';

class ButtonSaveProdform extends StatelessWidget {
  final ProductModel productModel;

  const ButtonSaveProdform({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    String quantity;
    String price;

    return ElevatedButton(
      onPressed: () async {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        quantity = context.read<TxtQuantityCubit>().state;
        price = context.read<TxtPriceCubit>().state;
        context
            .read<SaveProductsCubit>()
            .save(productModel, quantity, price, productModel.weight);
        context.read<ProductsListCubit>().productsShoppingCart();
        final pref = await SharedPreferences.getInstance();
        print(pref.getStringList('shoppingcart')!.first);
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
