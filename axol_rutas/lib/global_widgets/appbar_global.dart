import 'package:flutter/material.dart';

import '../../../../settings/theme.dart';
import 'iconbutton_return.dart';

class AppBarGlobal extends StatelessWidget {
  final String title;
  final IconButtonReturn? iconButton;

  const AppBarGlobal(
      {super.key, required this.title, required this.iconButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorPalette.primaryBackground,
      automaticallyImplyLeading: false,
      leading: iconButton,
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
