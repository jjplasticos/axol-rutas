import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/sales_report/salesreport_cubit.dart';
import '../../cubit/sales_report/salesreport_state.dart';
import '../../cubit/sales_report/srep_form_cubit.dart';
import '../../model/srep_form_model.dart';
import '../views/sales_report_view.dart';

class SalesReportController extends StatelessWidget {

  const SalesReportController({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SalesReportCubit()),
        BlocProvider(create: (_) => SRepFormCubit()),
      ], 
      child: BlocConsumer<SalesReportCubit, SalesReportState>(
      bloc: context.read<SalesReportCubit>()..load(SRepFormModel.empty()),
      listener: (context, state) {
        if (state is ErrorState) {
          final snackBar = SnackBar(content: Text(state.error));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          // ignore: prefer_const_constructors
          return SalesReportView(isLoading: true,);
        } else if (state is LoadedState) {
          // ignore: prefer_const_constructors
          return SalesReportView(isLoading: false,);
        } else {
          // ignore: prefer_const_constructors
          return SalesReportView(isLoading: false,);
        }
      },
    ),
      );
  }
}