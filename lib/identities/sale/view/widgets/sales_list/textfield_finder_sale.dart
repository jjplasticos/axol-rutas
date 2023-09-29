import 'package:axol_rutas/identities/sale/cubit/sales_cubit/sale_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/theme.dart';
import '../../../cubit/sales_cubit/sales_view_cubit.dart';
import '../../../model/sale_form_model.dart';
//import '../../../cubit/textfield_finder_sale_cubit.dart';

class TextFieldFinderSale extends StatelessWidget {
  const TextFieldFinderSale({super.key});

  @override
  Widget build(BuildContext context) {
    SaleFormModel form = context.read<SaleFormCubit>().state;
    final controller = TextEditingController()
      ..text = form.finder.text
      ..selection = TextSelection.collapsed(offset: form.finder.position);
    final time = form.dateTime;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        TextButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
            ).then((value) {
              if (value != null) {
                context.read<SaleFormCubit>().changeTime(value);
                form = context.read<SaleFormCubit>().state;
                context.read<SalesViewCubit>().load(form);
              }
            });
          },
          child: Text(
            '${time.day}/${time.month}/${time.year}',
            style: Typo.hintText,
            ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
            child: TextField(
              cursorColor: ColorPalette.primary,
              controller: controller,
              autofocus: false,
              obscureText: false,
              onChanged: (value) {
                context.read<SaleFormCubit>().changeFinder(
                      value,
                      controller.selection.base.offset,
                    );
                //context.read<SalesListCubit>().getSalesList(value);
              },
              onSubmitted: (value) {
                context.read<SaleFormCubit>().changeFinder(
                      value,
                      controller.selection.base.offset,
                    );
                form = context.read<SaleFormCubit>().state;
                context.read<SalesViewCubit>().load(form);
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
            context.read<SaleFormCubit>().changeFinder('', 0);
            context.read<SaleFormCubit>().changeTime(DateTime.now());
            context.read<SalesViewCubit>().load(SaleFormModel.empty());
          },
        )
      ],
    );
  }
}
