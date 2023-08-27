import 'package:flutter/material.dart';

import '../../../../../settings/theme.dart';

class FinderSalesReport extends StatelessWidget {
  const FinderSalesReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorPalette.secondaryBackground),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: TextField(
                //controller: controller,
                onChanged: (value) {
                  //context.read<TextFieldFinderSaleCubit>().change(value);
                  //context.read<SalesListCubit>().getSalesList(value);
                },
                onSubmitted: (value) {
                  //context.read<TextFieldFinderSaleCubit>().change(value);
                  //context.read<SalesListCubit>().getSalesList(value);
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
              //context.read<TextFieldFinderSaleCubit>().clear();
              //context.read<SalesListCubit>().getSalesList('');
            },
          )
        ],
      ),
    );
  }
}
