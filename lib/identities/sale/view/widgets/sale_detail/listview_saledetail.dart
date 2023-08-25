import 'package:flutter/material.dart';

import '../../../../../settings/theme.dart';
import '../../../../shoppingcart/model/shoppingcart_models.dart';
import '../../../model/sale_model.dart';

class ListviewSaleDetail extends StatelessWidget {
  final bool? isLoading;
  //final List<ShoppingcartItemModel> shoppingcart;
  final SaleModel sale;

  const ListviewSaleDetail({super.key, this.isLoading, required this.sale});

  @override
  Widget build(BuildContext context) {
    List itemList = sale.products.values.toList();

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      //itemCount: shoppingcart.length,
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        final item = itemList[index].toString().split('//');
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
                                  Text(item.elementAt(0),
                                      style: Typo.bodyText1),
                                  Text(
                                    item.elementAt(4),
                                    style: Typo.bodyText1,
                                  )
                                ],
                              ),
                            ),
                          ),
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
                              item.elementAt(1),
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
                                  item.elementAt(2),
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
                                    item.elementAt(3),
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