import 'package:flutter/material.dart';

import '../../../../settings/theme.dart';

class IconButtonReturn extends StatelessWidget {
  const IconButtonReturn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: ColorPalette.primaryText,
          size: 30,
        ));
  }
}
