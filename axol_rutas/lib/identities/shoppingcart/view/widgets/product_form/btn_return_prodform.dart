import 'package:flutter/material.dart';

import '../../../../../settings/theme.dart';

class ButtonReturnProdform extends StatelessWidget {
  const ButtonReturnProdform({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        Navigator.of(context).pop();
      },
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(80, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: ColorPalette.secondary),
      child: const Icon(Icons.keyboard_return, size: 30),
    );
  }
}
