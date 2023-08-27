import 'package:flutter/material.dart';

import '../../../model/sale_report_model.dart';

class ListviewSalesReport extends StatelessWidget {
  final List<SaleReportModel> listData;

  const ListviewSalesReport({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: listData.length,
        itemBuilder: (context, index) {
          final elementList = listData[index];
          return Container();
        },
        )
      );
  }
}