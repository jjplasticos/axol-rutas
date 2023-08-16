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
                height: 200,
                decoration: BoxDecoration(
                  color: ColorPalette.secondaryBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(rcCard.id.toString()),
                        Text(rcCard.name),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Dirección: '),
                        Text(rcCard.address[RouteCustomerModel.pAddress]),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Colonia: '),
                        Text(rcCard.address[RouteCustomerModel.pHood]),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Municipio: '),
                        Text(rcCard.address[RouteCustomerModel.pTown]),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Estado: '),
                        Text(rcCard.address[RouteCustomerModel.pCountry]),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Validación: '),
                        rcCard.validation[RouteCustomerModel.pStatus] == false
                            ? const Icon(Icons.check_box_outline_blank_outlined)
                            : const Icon(Icons.check_box_outlined)
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
