import 'package:flutter/material.dart';

import '../../../../settings/theme.dart';
import '../../cubit/lists_products/lists_products_controller.dart';
import '../widgets/product_finder/btn_cancel_product_finder.dart';
import '../widgets/product_finder/txt_finder.dart';

class ProductFinder extends StatelessWidget {
  const ProductFinder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 303.5,
      height: 479.7,
      decoration: const BoxDecoration(
        color: ColorPalette.primaryBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorPalette.secondaryBackground),
                    child: const TextFieldFinder())),
            const Expanded(
                child: ProductsFinderController(filter: '',)
                ),
            const Padding(
              padding: EdgeInsetsDirectional.all(8),
              child: BtnCancelProductFinder(),
            )
          ],
        ),
      ),
    );
  }
}
