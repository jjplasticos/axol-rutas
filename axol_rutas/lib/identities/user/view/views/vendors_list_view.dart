import 'package:flutter/material.dart';

import '../../../../global_widgets/appbar_global.dart';
import '../../../../global_widgets/iconbutton_select.dart';
import '../../../../settings/theme.dart';

class VendorsListView extends StatelessWidget {
  const VendorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = 'Vendedores';

    return const Scaffold(
      backgroundColor: ColorPalette.primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarGlobal(
            title: title, iconButton: IconButtonSelect(iconName: 'menu')),
      ),
    );
  }
}
