import 'package:flutter/material.dart';

import '../../../../settings/theme.dart';

class AppBarSales extends StatelessWidget {
  final String title;

  const AppBarSales({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorPalette.primaryBackground,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: Typo.title1,
      ),
      actions: const [],
      centerTitle: true,
      elevation: 2,
    );
  }
}
