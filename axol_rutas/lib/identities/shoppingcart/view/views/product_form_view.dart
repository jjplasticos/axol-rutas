import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settings/theme.dart';
import '../../../product/model/product.dart';
import '../../cubit/product_finder/product_finder_cubit.dart';
import '../../cubit/shoppingcart_cubit.dart';
import '../../cubit/shoppingcart_txt_cubit.dart';
import '../../model/shoppingcart_item.dart';
import '../widgets/product_form/btn_return_prodform.dart';
import '../widgets/product_form/btn_save_prodform.dart';
import '../widgets/product_form/txt_price_prodform.dart';
import '../widgets/product_form/txt_quantity_prodform.dart';

class ProductFormView extends StatelessWidget {
  final ProductModel product;
  final String stock;
  final List<ShoppingcartItemModel> shoppingcart;

  const ProductFormView(
      {super.key,
      required this.stock,
      required this.product,
      required this.shoppingcart});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => TxtQuantityCubit()),
          BlocProvider(create: (_) => TxtPriceCubit()),
          BlocProvider(create: (_) => ProductFinderCubit()),
          BlocProvider(create: (_) => ShoppingcartCubit()),
        ],
        child: Container(
          width: 300,
          height: 300,
          decoration: const BoxDecoration(
            color: ColorPalette.primaryBackground,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(product.code, style: Typo.labelText1),
                      Text(product.description, style: Typo.labelText1),
                    ],
                  ),
                ),
                const TextFieldQuantity(),
                const TextFieldPrice(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Existencias: ', style: Typo.labelText1),
                    Text(stock.toString(), style: Typo.bodyText5),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ButtonSaveProdform(
                            product: product,
                            shoppingcart: shoppingcart,
                            stock: double.parse(stock)),
                      ),
                      const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: ButtonReturnProdform()),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
