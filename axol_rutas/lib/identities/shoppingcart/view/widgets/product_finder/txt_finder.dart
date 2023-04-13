import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/theme.dart';
import '../../../cubit/product_finder/product_finder_cubit.dart';
import '../../../cubit/shoppingcart_txt_cubit.dart';

class TextFieldFinder extends StatelessWidget {
  const TextFieldFinder({super.key});

  @override
  Widget build(BuildContext context) {
    final txtValue = context.watch<FinderTxtCubit>().state;
    final controller = TextEditingController()
      ..text = txtValue
      ..selection = TextSelection.collapsed(offset: txtValue.length);

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
            child: TextFormField(
              controller: controller,
              autofocus: false,
              obscureText: false,
              onChanged: (value) {
                context.read<FinderTxtCubit>().change(value);
                context.read<ProductFinderCubit>().productsInventory(value);
              },
              decoration: InputDecoration(
                  hintText: 'Buscar',
                  hintStyle: Typo.hintText,
                  filled: true,
                  fillColor: ColorPalette.secondaryBackground,
                  border: InputBorder.none),
              style: Typo.textField1,
            ),
          ),
        ),
        IconButton(
          iconSize: 30,
          color: ColorPalette.secondaryText,
          icon: const Icon(
            Icons.cancel,
          ),
          onPressed: () {
            context.read<FinderTxtCubit>().clear();
            print('Presionando...');
          },
        )
      ],
    );
  }
}
