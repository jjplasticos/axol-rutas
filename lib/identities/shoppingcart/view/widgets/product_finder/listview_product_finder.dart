// ignore_for_file: constant_identifier_names

import 'package:axol_rutas/identities/product/model/product.dart';
import 'package:axol_rutas/identities/shoppingcart/cubit/shppcitem_form/shppcitem_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/theme.dart';
import '../../../cubit/shppcitem_form/shppcitem_view_cubit.dart';
import '../../../model/shoppingcart_models.dart';
import '../../controllers/shppcitem_view_controller.dart';

class ListviewProductFinder extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final List<ShoppingcartItemModel> shoppingcart;

  const ListviewProductFinder(
      {super.key, required this.products, required this.shoppingcart});

  @override
  Widget build(BuildContext context) {
    const String STOCK = 'Stock';
    const String PRODUCT_MODEL = 'ProductModel';
    const String LBL_STOCK = 'Stock: ';

    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: products.length,
        itemBuilder: ((context, index) {
          final elementList = products[index];
          final ProductModel elementProduct = elementList[PRODUCT_MODEL];
          return OutlinedButton(
            onPressed: () async {
              await showModalBottomSheet(
                  isDismissible: true,
                  isScrollControlled: true,
                  backgroundColor: ColorPalette.primaryBackground,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: MultiBlocProvider(
                          providers: [
                            BlocProvider(create: (_) => ShppcitemViewCubit()),
                            BlocProvider(create: (_) => ShppcitemFormCubit()),
                          ],
                          child: ShppcitemViewController(
                            act: 0,
                            index: 0,
                            shoppingcart: shoppingcart,
                            product: elementProduct,
                            stock: double.parse(elementList[STOCK]),
                          ),
                        ));
                  });
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: ColorPalette.secondaryBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: 30,
                              decoration: const BoxDecoration(
                                  color: ColorPalette.secondaryBackground,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      topLeft: Radius.circular(12))),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    elementProduct.code,
                                    style: Typo.bodyText6,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Text(LBL_STOCK,
                                          style: Typo.bodyText6),
                                      Text(
                                        elementList[STOCK].toString(),
                                        style: Typo.bodyText6,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Text(
                              elementProduct.description,
                              style: Typo.bodyText1,
                            )
                          ],
                        ),
                        const Icon(
                          Icons.navigate_next,
                          color: ColorPalette.secondaryText,
                          size: 30,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
