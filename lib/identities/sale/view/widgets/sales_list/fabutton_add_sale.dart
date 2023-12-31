import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/theme.dart';
import '../../../../shoppingcart/cubit/shoppingcart/shppc_cubit.dart';
import '../../../../shoppingcart/cubit/shoppingcart/shppc_view_cubit.dart';
import '../../../../shoppingcart/cubit/shoppingcart_view_cubit/shoppingcart_view_cubit.dart';
import '../../../../shoppingcart/view/controllers/shoppingcart_controller.dart';
import '../../../cubit/sales_cubit/sales_view_cubit.dart';
import '../../../model/sale_form_model.dart';

class FABtnAddSale extends StatelessWidget {
  const FABtnAddSale({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context_) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => ShoppingcartViewCubit()),
                  BlocProvider(create: (_) => ShppcCubit()),
                  BlocProvider(create: (_) => ShppcViewCubit()),
                ],
                child: const ShoppingcartController(),
              ),
            )).then((value) {
          context.read<SalesViewCubit>().load(SaleFormModel.empty());
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
