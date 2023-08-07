import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/theme.dart';
import '../../../../shoppingcart/cubit/shoppingcart_view_cubit/shoppingcart_view_cubit.dart';
import '../../../../shoppingcart/view/controllers/shppc_view_controller.dart';
import '../../../cubit/sales_list/saleslist_cubit.dart';

class FABtnAddSale extends StatelessWidget {
  const FABtnAddSale({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context_) => BlocProvider(
                create: (_) => ShoppingcartViewCubit(),
                child: const ShppcViewController(),
              ),
            )).then((value) {
          context.read<SalesListCubit>().getSalesList('');
        });
      },
      backgroundColor: ColorPalette.primary,
      elevation: 8,
      child: const Icon(
        Icons.add,
        color: ColorPalette.primaryText,
        size: 24,
      ),
    );
  }
}
