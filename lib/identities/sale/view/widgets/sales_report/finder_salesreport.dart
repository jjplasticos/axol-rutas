import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/theme.dart';
import '../../../cubit/sales_report/salesreport_cubit.dart';
import '../../../cubit/sales_report/srep_form_cubit.dart';
import '../../../model/srep_form_model.dart';

class FinderSalesReport extends StatelessWidget {
  const FinderSalesReport({super.key});

  @override
  Widget build(BuildContext context) {
    final finder = context.read<SRepFormCubit>().state.finder;
    final TextEditingController controller = TextEditingController()
      ..text = finder.text
      ..selection = TextSelection.collapsed(offset: finder.position);
    SRepFormModel form;
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
                controller: controller,
                onChanged: (value) {
                  context
                      .read<SRepFormCubit>()
                      .changeFinder(value, controller.selection.base.offset);
                },
                onSubmitted: (value) {
                  context
                      .read<SRepFormCubit>()
                      .changeFinder(value, controller.selection.base.offset);
                  form = context.read<SRepFormCubit>().state;
                  context.read<SalesReportCubit>().load(form);
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
              context
                      .read<SRepFormCubit>()
                      .changeFinder('', 0);
                  form = context.read<SRepFormCubit>().state;
                  context.read<SalesReportCubit>().load(form);
            },
          )
        ],
      ),
    );
  }
}
