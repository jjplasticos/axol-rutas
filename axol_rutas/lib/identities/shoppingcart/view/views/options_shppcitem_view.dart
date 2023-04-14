import 'package:flutter/material.dart';

import '../../../../settings/theme.dart';
import '../widgets/btn_option_shppcitem.dart';

class OptionsShppcitemView extends StatelessWidget {
  const OptionsShppcitemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: const BoxDecoration(
        color: ColorPalette.primaryBackground,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            BtnOptionShppcItem(
                text: 'Editar', color: ColorPalette.primary, action: 0),
            BtnOptionShppcItem(
                text: 'Eliminar', color: ColorPalette.alternate, action: 1),
            BtnOptionShppcItem(
                text: 'Cancelar', color: ColorPalette.secondary, action: 2),
          ],
        ),
      ),
    );
  }
}
