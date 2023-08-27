// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global_widgets/appbar/appbar_global.dart';
import '../../../../global_widgets/appbar/iconbutton_return.dart';
import '../../../../global_widgets/bottom_navigation_bar/navigation_bar_global.dart';
import '../../../../settings/theme.dart';
import '../../cubit/sales_report/salesreport_cubit.dart';
import '../../cubit/sales_report/srep_form_cubit.dart';
import '../widgets/sales_report/finder_salesreport.dart';
import '../widgets/sales_report/time_filter_SRep.dart';

class SalesReportView extends StatelessWidget {
  final bool isLoading;

  const SalesReportView({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    const String TITLE = 'Reporte de ventas';
    return Scaffold(
        backgroundColor: ColorPalette.primaryBackground,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarGlobal(title: TITLE, iconButton: null, iconActions: []),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
                // ignore: prefer_const_constructors
                FinderSalesReport(),
                // ignore: prefer_const_constructors
                TimeFilterSRep(),
                Visibility(
                  visible: isLoading,
                  replacement: const SizedBox(height: 4,),
                  child: const LinearProgressIndicator(),
                  )
                
            ],
          ),
          ),
        bottomNavigationBar: const NavigationBarGlobal(currentIndex: 0));
  }
}
