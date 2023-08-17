import 'package:flutter/material.dart';

import '../../../../../settings/theme.dart';
import '../../../model/route_customer_model.dart';

class ListviewCustomer extends StatelessWidget {
  final List<RouteCustomerModel> listData;

  const ListviewCustomer({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: listData.length,
        itemBuilder: ((context, index) {
          final rcCard = listData[index];
          return Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop<RouteCustomerModel>(context, rcCard);
              },
              child: Container(
                width: double.infinity,
                height: 160,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorPalette.secondaryBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          rcCard.id.toString(),
                          style: Typo.bodyText1,
                        ),
                        Text(
                          rcCard.name,
                          style: Typo.bodyText1,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Dirección: ',
                          style: Typo.bodyText6,
                        ),
                        Text(rcCard.address[RouteCustomerModel.pAddress],
                            style: Typo.bodyText6),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Colonia: ',
                          style: Typo.bodyText6,
                        ),
                        Text(
                          rcCard.address[RouteCustomerModel.pHood],
                          style: Typo.bodyText6,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Municipio: ',
                          style: Typo.bodyText6,
                        ),
                        Text(
                          rcCard.address[RouteCustomerModel.pTown],
                          style: Typo.bodyText6,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Estado: ',
                          style: Typo.bodyText6,
                        ),
                        Text(
                          rcCard.address[RouteCustomerModel.pCountry],
                          style: Typo.bodyText6,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Validación: ',
                          style: Typo.bodyText6,
                        ),
                        rcCard.validation[RouteCustomerModel.pStatus] == false
                            ? const Icon(
                                Icons.check_box_outline_blank_outlined,
                                color: ColorPalette.secondaryText,
                              )
                            : const Icon(Icons.check_box_outlined,
                                color: ColorPalette.secondaryText)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
