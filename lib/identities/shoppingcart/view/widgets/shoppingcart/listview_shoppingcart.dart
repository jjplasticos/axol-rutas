// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../settings/theme.dart';
import '../../../cubit/shoppingcart/shppc_cubit.dart';
import '../../../model/shoppingcart_models.dart';
import 'icon_button_shppcitem.dart';

class ListviewShoppingcart extends StatelessWidget {
  final bool isIconEditVisible;

  const ListviewShoppingcart({super.key, required this.isIconEditVisible});

  @override
  Widget build(BuildContext context) {
    final List<ShoppingcartItemModel> shoppingcart =
        context.read<ShppcCubit>().state.shoppingcart;
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: shoppingcart.length,
      itemBuilder: (context, index) {
        final shoppingCartItem = shoppingcart[index];
        return Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
            child: Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                  color: ColorPalette.secondaryBackground,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: const BoxDecoration(
                                color: ColorPalette.secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(shoppingCartItem.product.code,
                                      style: Typo.bodyText1),
                                  Text(
                                    shoppingCartItem.product.description,
                                    style: Typo.bodyText1,
                                  )
                                ],
                              ),
                            ),
                          ),
                          IconButtonShppcItem(
                              isVisible: isIconEditVisible,
                              index: index,
                              shoppingcart: shoppingcart),
                          /*IconButton(
                              onPressed: () async {
                                await showModalBottomSheet(
                                    isDismissible: false,
                                    isScrollControlled: true,
                                    backgroundColor:
                                        ColorPalette.primaryBackground,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: OptionsShppcitemView(
                                          shoppingcart: shoppingCart,
                                          index: index,
                                        ),
                                      );
                                    }).then((value) {
                                  context
                                      .read<ShoppingcartCubit>()
                                      .returnShoppingcart(value);
                                });
                              },
                              icon: const Icon(Icons.more_vert,
                                  color: ColorPalette.secondaryText, size: 25))*/
                        ]),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.28,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: ColorPalette.secondaryBackground,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              shoppingCartItem.quantity.toString(),
                              style: Typo.bodyText3,
                            ),
                            const Text(
                              'Cantidad',
                              style: Typo.labelText2,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 60,
                        decoration: const BoxDecoration(
                            color: ColorPalette.secondaryBackground),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  shoppingCartItem.product.weight,
                                  style: Typo.bodyText3,
                                ),
                                const Text(
                                  'kg',
                                  style: Typo.bodyText3,
                                )
                              ],
                            ),
                            const Text(
                              'Peso unitario',
                              style: Typo.labelText2,
                            )
                          ],
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.36,
                          height: 60,
                          decoration: const BoxDecoration(
                              color: ColorPalette.secondaryBackground,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12))),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    '\$',
                                    style: Typo.bodyText3,
                                  ),
                                  Text(
                                    shoppingCartItem.price.toString(),
                                    style: Typo.bodyText3,
                                  )
                                ],
                              ),
                              const Text(
                                'Precio unitario',
                                style: Typo.labelText2,
                              )
                            ],
                          ))
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}
