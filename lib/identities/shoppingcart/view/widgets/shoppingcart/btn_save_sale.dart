import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../settings/theme.dart';
import '../../../cubit/save_shoppingcart/save_shoppingcart_cubit.dart';
import '../../../cubit/shoppingcart_cubit.dart';
import '../../../cubit/shoppingcart_txt_cubit.dart';
import '../../../model/shoppingcart_models.dart';

class BtnSaveSale extends StatelessWidget {
  final bool? isLoading;
  //final String timePick;
  const BtnSaveSale({super.key, this.isLoading});

  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: ColorPalette.primary),
      child: const Text(
        'Guardar',
        style: Typo.textButton,
      ),
      onPressed: () async {
        if (isLoading == null || isLoading == false) {
          final ShoppingcartResultsModel shoppingcartResults =
            context.read<ShoppingcartCubit>().state;
        final String customerName = context.read<TxtCustomerNameCubit>().state;
        context
            .read<SaveShoppingcartCubit>()
            .verification(customerName, shoppingcartResults, 'timePick');
        }
      },
    );
  }
}
