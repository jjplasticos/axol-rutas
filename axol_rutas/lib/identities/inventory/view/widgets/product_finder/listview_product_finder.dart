import 'package:axol_rutas/identities/product/model/product.dart';
import 'package:flutter/material.dart';

import '../../../../../settings/theme.dart';
import '../../pages/product_form_page.dart';

class ListviewProductFinder extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const ListviewProductFinder({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: products.length,
        itemBuilder: ((context, index) {
          final elementList = products[index];
          final ProductModel elementProduct = elementList['ProductModel'];
          return Padding(
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  elementProduct.code,
                                  style: Typo.bodyText6,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Text('Stock: ',
                                        style: Typo.bodyText6),
                                    Text(
                                      elementList['Stock'].toString(),
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
                      IconButton(
                        onPressed: () async {
                          await showModalBottomSheet(
                              isDismissible: false,
                              isScrollControlled: true,
                              backgroundColor: ColorPalette.primaryBackground,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: ProductFormPage(
                                    code: elementList['code'],
                                    description: elementList['description'],
                                    stock: elementList['stock'],
                                    weight: elementList['weight'],
                                  ),
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.navigate_next,
                          color: ColorPalette.secondaryText,
                          size: 30,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }
}
