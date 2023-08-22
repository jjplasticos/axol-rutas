import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/theme.dart';
import '../../../cubit/options_shppc_item/options_shppcitem_cubit.dart';
import '../../../cubit/shoppingcart/shppc_cubit.dart';
import '../../../cubit/shoppingcart/shppc_view_cubit.dart';
import '../../../cubit/shoppingcart_cubit.dart';
import '../../../model/shoppingcart_models.dart';
import '../../controllers/btn_options_shppcitem_controller.dart';
import '../../views/options_shppcitem_view.dart';

class IconButtonShppcItem extends StatelessWidget {
  final bool isVisible;
  final List<ShoppingcartItemModel> shoppingcart;
  final int index;

  const IconButtonShppcItem(
      {super.key,
      required this.isVisible,
      required this.shoppingcart,
      required this.index});

  @override
  Widget build(BuildContext context) {
    if (isVisible) {
      return IconButton(
          onPressed: () async {
            await showModalBottomSheet(
                isDismissible: false,
                isScrollControlled: true,
                backgroundColor: ColorPalette.primaryBackground,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: BlocProvider(
                        create: (_) => OptionsShppcItemCubit(),
                        child: BtnOptionsShppcItemController(
                          index: index,
                          shoppingcart: shoppingcart,
                        )),
                    /*OptionsShppcitemView(
                      shoppingcart: shoppingcart,
                      index: index,
                    ),*/
                  );
                }).then((value) {
              context.read<ShppcCubit>().changeShppc(value);
              context.read<ShppcViewCubit>().load();
              //context.read<ShoppingcartCubit>().returnShoppingcart(value);
            });
          },
          icon: const Icon(Icons.more_vert,
              color: ColorPalette.secondaryText, size: 25));
    } else {
      return const Text('');
    }
  }
}
