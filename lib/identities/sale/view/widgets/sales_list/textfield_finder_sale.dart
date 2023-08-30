import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/theme.dart';
import '../../../cubit/sales_list/saleslist_cubit.dart';
import '../../../cubit/textfield_finder_sale_cubit.dart';

class TextFieldFinderSale extends StatelessWidget {
  const TextFieldFinderSale({super.key});

  @override
  Widget build(BuildContext context) {
    final txtValue = context.watch<TextFieldFinderSaleCubit>().state;
    final controller = TextEditingController()
      ..text = txtValue
      ..selection = TextSelection.collapsed(offset: txtValue.length);

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
            child: TextField(
              cursorColor: ColorPalette.primary,
              controller: controller,
              autofocus: false,
              obscureText: false,
              onChanged: (value) {
                context.read<TextFieldFinderSaleCubit>().change(value);
                //context.read<SalesListCubit>().getSalesList(value);
              },
              onSubmitted: (value) {
                context.read<TextFieldFinderSaleCubit>().change(value);
                context.read<SalesListCubit>().getSalesList(value);
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
            context.read<TextFieldFinderSaleCubit>().clear();
            context.read<SalesListCubit>().getSalesList('');
          },
        )
      ],
    );
  }
}
