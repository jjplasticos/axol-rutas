import 'package:flutter/material.dart';

import '../settings/theme.dart';

class IconButtonActions extends StatelessWidget {
  final int action;

  const IconButtonActions({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    switch (action) {
      case 0:
        return const Text('');
      case 1:
        return IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: ColorPalette.primaryText,
              size: 30,
            ));
      default:
        return const Text('');
    }
  }
}
