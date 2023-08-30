import 'package:axol_rutas/identities/shoppingcart/model/shoppingcart_models.dart';
import 'package:flutter/material.dart';

import '../../../../settings/theme.dart';
import '../widgets/btn_option_shppcitem.dart';

class OptionsShppcitemView extends StatelessWidget {
  final List<ShoppingcartItemModel> shoppingcart;
  final int index;
  final bool? isLoading;
  final double? stock;
  const OptionsShppcitemView(
      {super.key,
      required this.shoppingcart,
      required this.index,
      this.isLoading,
      this.stock});

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
      child: Column(
        children: [
          Visibility(
              visible: isLoading ?? false,
              replacement: const SizedBox(height: 4),
              child: const LinearProgressIndicator(
                color: ColorPalette.primary,
                backgroundColor: ColorPalette.secondaryBackground,
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BtnOptionShppcItem(
                    text: 'Editar',
                    color: ColorPalette.primary,
                    action: 0,
                    shoppingcart: shoppingcart,
                    index: index,
                    stock: stock,
                  ),
                  BtnOptionShppcItem(
                    text: 'Eliminar',
                    color: ColorPalette.alternate,
                    action: 1,
                    shoppingcart: shoppingcart,
                    index: index,
                  ),
                  BtnOptionShppcItem(
                    text: 'Cancelar',
                    color: ColorPalette.secondary,
                    action: 2,
                    shoppingcart: shoppingcart,
                    index: index,
                  ),
                  //const BtnOptionsShppcItemController()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
