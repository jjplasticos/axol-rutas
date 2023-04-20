import 'package:flutter/material.dart';

import '../../../../settings/theme.dart';
import '../identities/inventory/repository/inventory_repo.dart';

class IconButtonSelect extends StatelessWidget {
  final String? iconName;

  const IconButtonSelect({super.key, required this.iconName});

  @override
  Widget build(BuildContext context) {
    if (iconName == 'return') {
      return IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorPalette.primaryText,
            size: 30,
          ));
    } else if (iconName == 'menu') {
      return IconButton(
          onPressed: () {
            Navigator.pop(context);
            //LocalShoppingcart().clearShoppingCart();
          },
          icon: const Icon(
            Icons.menu,
            color: ColorPalette.primaryText,
            size: 30,
          ));
    } else {
      return IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.error,
            color: ColorPalette.primaryText,
            size: 30,
          ));
    }
  }
}
