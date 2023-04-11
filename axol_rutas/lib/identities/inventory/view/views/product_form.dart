import 'package:flutter/material.dart';

import '../../../../settings/theme.dart';
import '../widgets/product_form/btn_return_prodform.dart';
import '../widgets/product_form/btn_save_prodform.dart';
import '../widgets/product_form/txt_price_prodform.dart';
import '../widgets/product_form/txt_quantity_prodform.dart';

class ProductForm extends StatelessWidget {
  const ProductForm(
      {super.key,
      required this.code,
      required this.description,
      required this.stock,
      required this.weight});

  final String code;
  final String description;
  final String stock;
  final String weight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: const BoxDecoration(
        color: ColorPalette.primaryBackground,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(code, style: Typo.labelText1),
                  Text(description, style: Typo.labelText1),
                ],
              ),
            ),
            const TextFieldQuantity(),
            const TextFieldPrice(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Existencias: ', style: Typo.labelText1),
                Text(stock.toString(), style: Typo.bodyText5),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Expanded(
                    child: ButtonSaveProdform(),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                      child: ButtonReturnProdform()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
