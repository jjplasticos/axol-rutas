import 'package:flutter/material.dart';

import '../../../../../settings/format.dart';
import '../../../../../settings/theme.dart';
import '../../../model/sale_report_model.dart';

class ListviewSalesReport extends StatelessWidget {
  final List<SaleReportModel> listData;

  const ListviewSalesReport({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      shrinkWrap: true,
      itemCount: listData.length,
      itemBuilder: (context, index) {
        final element = listData[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Container(
            height: 165,
            width: double.infinity,
            decoration: BoxDecoration(
                color: ColorPalette.secondaryBackground,
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        FormatDate.ddmmyyyy(element.dateTime),
                        style: Typo.bodyText2,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(element.product.code, style: Typo.bodyText1),
                              Text(element.product.type, style: Typo.bodyText1),
                            ],
                          ),
                          /*const SizedBox(
                            height: 4,
                          ),*/
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(element.product.packing,
                                  style: Typo.bodyText1),
                              Text(element.product.capacity,
                                  style: Typo.bodyText1),
                            ],
                          ),
                          /*const SizedBox(
                            height: 4,
                          ),*/
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(element.product.measure,
                                  style: Typo.bodyText1),
                              Text(element.product.gauge,
                                  style: Typo.bodyText1),
                              Text(element.product.pieces,
                                  style: Typo.bodyText1),
                            ],
                          ),
                        ],
                      ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        Text(FormatNumber.format2dec(element.quantitySold),
                            style: Typo.bodyText3),
                        const Text('Cant. vend.', style: Typo.bodyText2),
                      ]),
                      Column(children: [
                        Text('\$${FormatNumber.format2dec(element.unitPrice)}',
                            style: Typo.bodyText3),
                        const Text('Precio unitario', style: Typo.bodyText2),
                      ]),
                      Column(children: [
                        Text('\$${FormatNumber.format2dec(element.totalPrice)}',
                            style: Typo.bodyText3),
                        const Text('Importe', style: Typo.bodyText2)
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
