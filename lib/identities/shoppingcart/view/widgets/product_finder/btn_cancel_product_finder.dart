import 'package:flutter/material.dart';

import '../../../../../settings/theme.dart';
import '../../../model/shoppingcart_models.dart';

class BtnCancelProductFinder extends StatelessWidget {
  final List<ShoppingcartItemModel> shoppingcart;

  const BtnCancelProductFinder({super.key, required this.shoppingcart});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 60),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: ColorPalette.primary),
        child: const Text(
          'Regresar',
          style: Typo.textButton,
        ),
        onPressed: () {
          Navigator.of(context).pop(shoppingcart);
        },
      ),
    ]);
  }
}
