import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/theme.dart';
import '../../../../shoppingcart/view/views/shoppingcart_view.dart';
import '../../../cubit/saleslist_cubit.dart';

class FABtnAddSale extends StatelessWidget {
  const FABtnAddSale({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context_) => const ShoppingCartView())).then((value) {
          context.read<SalesListCubit>().getSalesList();
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
