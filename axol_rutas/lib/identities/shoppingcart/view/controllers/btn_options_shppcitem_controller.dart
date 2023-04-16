import 'package:axol_rutas/identities/shoppingcart/model/shoppingcart_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settings/theme.dart';
import '../../cubit/options_shppc_item/options_shppcitem_cubit.dart';
import '../../cubit/options_shppc_item/options_shppcitem_state.dart';
import '../views/product_form_view.dart';

class BtnOptionsShppcItemController extends StatelessWidget {
  const BtnOptionsShppcItemController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OptionsShppcItemCubit, OptionsShppcItemState>(
      listener: (context, state) async {
        if (state is EditState) {
          final ShoppingcartItemModel item =
              state.shoppingcart.elementAt(state.index);
          showModalBottomSheet(
              isDismissible: false,
              isScrollControlled: true,
              backgroundColor: ColorPalette.primaryBackground,
              enableDrag: false,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: ProductFormView(
                    product: item.product,
                    stock: state.stock,
                    shoppingcart: state.shoppingcart,
                    initialQuantity: item.quantity.toString(),
                    initnialPrice: item.price.toString(),
                    //Acción 1: para editar item.
                    act: 1,
                    index: state.index,
                  ),
                );
              });
        } else if (state is DeleteState) {
          Navigator.pop(context, state.shoppingcart);
        } else if (state is CancelState) {
          Navigator.pop(context, state.shoppingcart);
        } else if (state is ErrorState) {
          if (kDebugMode) {
            print(state.toString());
          }
        }
      },
      bloc: context.read<OptionsShppcItemCubit>(),
      child: Container(),
    );
  }
}
