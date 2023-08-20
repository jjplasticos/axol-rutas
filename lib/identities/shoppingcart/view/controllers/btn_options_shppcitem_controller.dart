import 'package:axol_rutas/identities/shoppingcart/model/shoppingcart_models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settings/theme.dart';
import '../../cubit/options_shppc_item/options_shppcitem_cubit.dart';
import '../../cubit/options_shppc_item/options_shppcitem_state.dart';
import '../../cubit/shppcitem_form/shppcitem_form_cubit.dart';
import '../../cubit/shppcitem_form/shppcitem_view_cubit.dart';
import 'shppcitem_view_controller.dart';

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
                    child: MultiBlocProvider(
                      providers: [
                        BlocProvider(create: (_) => ShppcitemViewCubit()),
                        BlocProvider(create: (_) => ShppcitemFormCubit()),
                      ],
                      child: ShppcitemViewController(
                        act: 1,
                        index: state.index,
                        shoppingcart: state.shoppingcart,
                        product: item.product,
                        stock: double.parse(state.stock),
                      ),
                    ));
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
