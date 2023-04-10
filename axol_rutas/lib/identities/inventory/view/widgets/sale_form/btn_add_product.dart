import 'package:axol_rutas/identities/product/repository/product_repo.dart';
import 'package:flutter/material.dart';

import '../../../../../../settings/theme.dart';
import '../../pages/product_fider_page.dart';

class BtnAddProduct extends StatelessWidget {
  const BtnAddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseProducts databaseProducts = DatabaseProducts();
    return ElevatedButton(
      onPressed: () async {
        showModalBottomSheet(
          isDismissible: false,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: const ProdctFinderPage(),
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorPalette.tertiary,
          minimumSize: const Size(180, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      child: const Icon(
        Icons.add_shopping_cart,
        size: 30,
        color: ColorPalette.primaryText,
      ),
    );
  }
}
