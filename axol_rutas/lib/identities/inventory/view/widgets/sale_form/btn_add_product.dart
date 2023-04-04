import 'package:flutter/material.dart';

import '../../../../../../settings/theme.dart';

class BtnAddProduct extends StatelessWidget {
  const BtnAddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        /*await showModalBottomSheet(
          isDismissible: false,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: SelectProduct(),
            );
          },
        ).then((value) => setState(() => _closeModal(value)));*/
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
