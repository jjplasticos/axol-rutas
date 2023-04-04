import 'package:flutter/material.dart';

import '../../../../../settings/theme.dart';

class FABtnAddSale extends StatelessWidget {
  const FABtnAddSale({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        //Pasa al popup de SalesForm
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
