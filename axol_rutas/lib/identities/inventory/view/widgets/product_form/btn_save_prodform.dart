import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/theme.dart';
import '../../../cubit/lists_products/lists_products_cubit.dart';

class ButtonSaveProdform extends StatelessWidget {
  const ButtonSaveProdform({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        context.read<ProductsListCubit>().productsShoppingCart();
      },
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(190, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: ColorPalette.primary),
      child: const Text(
        'Agregar',
        style: Typo.textButton,
      ),
    );
  }
}
