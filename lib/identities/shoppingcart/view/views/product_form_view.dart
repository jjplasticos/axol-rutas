import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settings/theme.dart';
import '../../cubit/product_finder/product_finder_cubit.dart';
import '../../cubit/shoppingcart_cubit.dart';
import '../../cubit/shppcitem_form/shppcitem_form_cubit.dart';
import '../../model/shoppingcart_models.dart';
import '../../model/shppcitem_form_model.dart';
import '../widgets/product_form/btn_return_prodform.dart';
import '../widgets/product_form/btn_save_prodform.dart';
import '../widgets/product_form/txt_price_prodform.dart';
import '../widgets/product_form/txt_quantity_prodform.dart';

class ProductFormView extends StatelessWidget {
  final List<ShoppingcartItemModel> shoppingcart;
  final int act;
  final int index;
  final bool isLoading;

  const ProductFormView(
      {super.key,
      required this.shoppingcart,
      required this.act,
      required this.index,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    ShppcitemFormModel form = context.read<ShppcitemFormCubit>().state;
    return MultiBlocProvider(
        providers: [
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
                Visibility(
                    visible: isLoading,
                    replacement: const SizedBox(
                      height: 4,
                    ),
                    child: const LinearProgressIndicator(
                      color: ColorPalette.primary,
                      backgroundColor: ColorPalette.secondaryBackground,
                    )),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(form.product.code, style: Typo.bodyText5),
                      Text(form.product.description, style: Typo.bodyText5),
                    ],
                  ),
                ),
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                      color: ColorPalette.secondaryBackground,
                      borderRadius: BorderRadius.circular(8)),
                  // ignore: prefer_const_constructors
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    // ignore: prefer_const_constructors
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      TextFieldQuantity(),
                      // ignore: prefer_const_constructors
                      TextFieldPrice(),
                    ],
                  ),
                  ) ,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Existencias: ', style: Typo.bodyText5),
                    Text(form.stock.toString(), style: Typo.bodyText5),
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
                          shoppingcart: shoppingcart,
                          act: act,
                          index: index,
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: ButtonReturnProdform()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
