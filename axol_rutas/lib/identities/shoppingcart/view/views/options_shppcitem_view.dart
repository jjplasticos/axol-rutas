import 'package:axol_rutas/identities/shoppingcart/model/shoppingcart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settings/theme.dart';
import '../../cubit/options_shppc_item/options_shppcitem_cubit.dart';
import '../controllers/btn_options_shppcitem_controller.dart';
import '../widgets/btn_option_shppcitem.dart';

class OptionsShppcitemView extends StatelessWidget {
  final List<ShoppingcartItemModel> shoppingcart;
  final int index;
  const OptionsShppcitemView(
      {super.key, required this.shoppingcart, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => OptionsShppcItemCubit(),
        child: Container(
          width: 300,
          height: 300,
          decoration: const BoxDecoration(
            color: ColorPalette.primaryBackground,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          ),
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
                const BtnOptionsShppcItemController()
              ],
            ),
          ),
        ));
  }
}
