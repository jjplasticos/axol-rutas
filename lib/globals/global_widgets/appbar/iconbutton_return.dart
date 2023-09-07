import 'package:flutter/material.dart';

import '../../../../../../settings/theme.dart';

class IconButtonReturn extends StatelessWidget {
  final String? iconName;
  final bool? isLoading;

  const IconButtonReturn({super.key, required this.iconName, this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (iconName == 'return') {
      return IconButton(
          onPressed: () {
            if (isLoading == null || isLoading == false) {
                Navigator.pop(context);
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorPalette.primaryText,
            size: 30,
          ));
    } else if (iconName == 'menu') {
      return IconButton(
          onPressed: () {
            if (isLoading == null || isLoading == false) {
              Navigator.pop(context);
            }
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
