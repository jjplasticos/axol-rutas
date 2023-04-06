import 'package:flutter/material.dart';

import '../../../../../settings/theme.dart';

class ListviewProductFinder extends StatelessWidget {
  final List<Map> products;

  const ListviewProductFinder({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: products.length,
        itemBuilder: ((context, index) {
          final elementList = products[index];
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
                                  elementList['code'],
                                  style: Typo.bodyText6,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Text('Stock: ',
                                        style: Typo.bodyText6),
                                    Text(
                                      elementList['stock'].toString(),
                                      style: Typo.bodyText6,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Text(
                            elementList['description'],
                            style: Typo.bodyText1,
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () async {
                          /*await showModalBottomSheet(
                              isDismissible: false,
                              isScrollControlled: true,
                              backgroundColor: ColorPalette.primaryBackground,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: SelectProductForm(
                                    code: elementList['code'],
                                    description: elementList['description'],
                                    stock: elementList['stock'],
                                    weight: elementList['weight'],
                                  ),
                                );
                              }).whenComplete(() => null);*/
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
