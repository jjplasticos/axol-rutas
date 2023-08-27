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
          onPressed: () {},
          child: Text(lblTime),
        ),
        Switch(
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
