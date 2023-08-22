import 'package:axol_rutas/identities/shoppingcart/model/shoppingcart_models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settings/theme.dart';
import '../../cubit/options_shppc_item/options_shppcitem_cubit.dart';
import '../../cubit/options_shppc_item/options_shppcitem_state.dart';
import '../../cubit/shppcitem_form/shppcitem_form_cubit.dart';
import '../../cubit/shppcitem_form/shppcitem_view_cubit.dart';
import '../views/options_shppcitem_view.dart';
import 'shppcitem_view_controller.dart';

class BtnOptionsShppcItemController extends StatelessWidget {
  final List<ShoppingcartItemModel> shoppingcart;
  final int index;

  const BtnOptionsShppcItemController({super.key, required this.shoppingcart, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OptionsShppcItemCubit, OptionsShppcItemState>(
      bloc: context.read<OptionsShppcItemCubit>()..load(),
      builder: ((context, state) {
        if (state is LoadingState) {
          return OptionsShppcitemView(
            index: index,
            shoppingcart: shoppingcart,
            isLoading: true,
          );
        } else if (state is LoadedState) {
          return OptionsShppcitemView(
            index: index,
            shoppingcart: shoppingcart,
            isLoading: false,
            stock: state.stock,
          );
        } else {
          return OptionsShppcitemView(
            index: index,
            shoppingcart: shoppingcart,
            isLoading: false,
          );
        }
      }),
      listener: (context, state) async {
        if (state is LoadedState) {
          if (state.isGetStock == true) {
            final ShoppingcartItemModel item =
              shoppingcart.elementAt(index);
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
                        index: index,
                        shoppingcart: shoppingcart,
                        product: item.product,
                        stock: state.stock,
                      ),
                    ));
              });
          }
        }
       /*if (state is EditState) {
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
        } else if (state is LoadingState) {
        } else if (state is DeleteState) {
          Navigator.pop(context, state.shoppingcart);
        } else if (state is CancelState) {
          Navigator.pop(context, state.shoppingcart);
        } else if (state is ErrorState) {
          if (kDebugMode) {
            print(state.toString());
          }
        }*/
      },
    );
  }
}
