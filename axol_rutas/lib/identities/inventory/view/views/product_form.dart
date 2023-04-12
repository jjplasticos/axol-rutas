import 'package:flutter/material.dart';

import '../../../../settings/theme.dart';
import '../../../product/model/product.dart';
import '../widgets/product_form/btn_return_prodform.dart';
import '../widgets/product_form/btn_save_prodform.dart';
import '../widgets/product_form/txt_price_prodform.dart';
import '../widgets/product_form/txt_quantity_prodform.dart';

class ProductForm extends StatelessWidget {
  final ProductModel productModel;
  final String stock;

  const ProductForm(
      {super.key, required this.productModel, required this.stock});

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
                  Text(productModel.code, style: Typo.labelText1),
                  Text(productModel.description, style: Typo.labelText1),
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
                children: [
                  Expanded(
                    child: ButtonSaveProdform(productModel: productModel),
                  ),
                  const Padding(
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
