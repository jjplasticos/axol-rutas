import 'package:flutter/material.dart';

import '../../../../settings/theme.dart';
import '../../model/inventory_model.dart';

class ListviewInventory extends StatelessWidget {
  final List<InventoryModel> listData;

  const ListviewInventory({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listData.length,
      itemBuilder: ((context, index) {
        final elementList = listData[index];
        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
          child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                  color: ColorPalette.secondaryBackground,
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    elementList.code,
                    style: Typo.bodyText1,
                  ),
                  Text(
                    elementList.product.description,
                    style: Typo.bodyText1,
                  ),
                  Text(
                    elementList.stock,
                    style: Typo.bodyText1,
                  )
                ],
              )),
        );
      }),
    );
  }
}
