import 'package:flutter/material.dart';

import '../../../../../settings/theme.dart';
import '../../../../inventory/view/pages/shoppingcart_page.dart';

class FABtnAddSale extends StatelessWidget {
  const FABtnAddSale({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ShoppingCartPage()));
      },
      backgroundColor: ColorPalette.primary,
      elevation: 8,
      child: const Icon(
        Icons.add,
        color: ColorPalette.primaryText,
        size: 24,
      ),
    );
  }
}
