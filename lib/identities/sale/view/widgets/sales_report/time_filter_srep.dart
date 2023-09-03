import 'package:axol_rutas/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/sales_report/salesreport_cubit.dart';
import '../../../cubit/sales_report/srep_form_cubit.dart';
import '../../../model/srep_form_model.dart';

class TimeFilterSRep extends StatelessWidget {
  const TimeFilterSRep({super.key});

  @override
  Widget build(BuildContext context) {
    SRepFormModel form = context.read<SRepFormCubit>().state;
    DateTime time = form.time;
    String lblTime = '${time.day}/${time.month}/${time.year}';
    bool isTime = form.isTime;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  context.read<SRepFormCubit>().changeTime(value);
                  context.read<SalesReportCubit>().load(form);
                }
              });
          },
          child: Text(lblTime, style: Typo.bodyText5,),
        ),
        Switch(
          activeColor: ColorPalette.primary,
          value: isTime,
          onChanged: (value) {
            context.read<SRepFormCubit>().changeIsTime(value);
            form = context.read<SRepFormCubit>().state;
            context.read<SalesReportCubit>().load(form);
          },
        )
      ],
    );
  }
}
