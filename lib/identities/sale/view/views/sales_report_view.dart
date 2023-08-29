// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../../../../global_widgets/appbar/appbar_global.dart';
import '../../../../global_widgets/bottom_navigation_bar/navigation_bar_global.dart';
import '../../../../settings/theme.dart';
import '../../model/sale_report_model.dart';
import '../widgets/sales_report/finder_salesreport.dart';
import '../widgets/sales_report/listview_sales_report.dart';
import '../widgets/sales_report/time_filter_SRep.dart';

class SalesReportView extends StatelessWidget {
  final bool isLoading;
  final List<SaleReportModel> saleReport;

  const SalesReportView({super.key, required this.isLoading, required this.saleReport});

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
                replacement: const SizedBox(
                  height: 4,
                ),
                child: const LinearProgressIndicator(),
              ),
              ListviewSalesReport(listData: saleReport),
            ],
          ),
        ),
        bottomNavigationBar: const NavigationBarGlobal(currentIndex: 2));
  }
}
