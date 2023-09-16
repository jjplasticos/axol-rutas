import 'package:flutter/material.dart';

import '../../../../../settings/theme.dart';
import '../../../model/route_customer_model.dart';
import '../../views/rc_select_info_view.dart';

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
              onLongPress: () {
                showModalBottomSheet(
                  isDismissible: true,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) => RcSelectInfoView(customer: rcCard),
                );
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
                          '${rcCard.id}    ',
                          style: Typo.bodyText1,
                        ),
                        Expanded(
                            child: Text(
                          rcCard.name,
                          style: Typo.bodyText1,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Dirección: ',
                          style: Typo.bodyText6,
                        ),
                        Expanded(
                            child: Text(
                          rcCard.address,
                          style: Typo.bodyText6,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Municipio: ',
                          style: Typo.bodyText6,
                        ),
                        Expanded(
                            child: Text(
                          rcCard.town,
                          style: Typo.bodyText6,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Estado: ',
                          style: Typo.bodyText6,
                        ),
                        Expanded(
                            child: Text(
                          rcCard.country,
                          style: Typo.bodyText6,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Giro: ',
                          style: Typo.bodyText6,
                        ),
                        Expanded(
                            child: Text(
                          rcCard.sector,
                          style: Typo.bodyText6,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
