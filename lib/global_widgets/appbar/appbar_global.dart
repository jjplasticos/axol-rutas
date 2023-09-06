import 'package:axol_rutas/global_widgets/appbar/iconbutton_actions.dart';
import 'package:flutter/material.dart';

import '../../../../../settings/theme.dart';
import 'iconbutton_return.dart';

class AppBarGlobal extends StatelessWidget {
  final String title;
  final IconButtonReturn? iconButton;
  final List<String> iconActions;

  const AppBarGlobal(
      {super.key,
      required this.title,
      required this.iconButton,
      required this.iconActions});

  @override
  Widget build(BuildContext context) {
    final IconButtonActions action0;
    const String EMPTY = '0';
    if (iconActions.isNotEmpty) {
      action0 = IconButtonActions(data: iconActions.elementAt(0));
    } else {
      action0 = const IconButtonActions(data: EMPTY);
    }
    return AppBar(
      backgroundColor: ColorPalette.primaryBackground,
      automaticallyImplyLeading: false,
      leading: iconButton,
      title: Text(
        title,
        style: Typo.title1,
      ),
      actions: [
        action0,
        const Text('060923.0', style: Typo.labelText1,)
      ],
      centerTitle: true,
      elevation: 2,
    );
  }
}
