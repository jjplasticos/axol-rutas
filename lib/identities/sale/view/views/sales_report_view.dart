// ignore_for_file: constant_identifier_names
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';

import '../../../../globals/global_widgets/appbar/appbar_global.dart';
import '../../../../globals/global_widgets/appbar/iconbutton_return.dart';
import '../../../../globals/global_widgets/bottom_navigation_bar/navigation_bar_global.dart';
import '../../../../settings/format.dart';
import '../../../../settings/theme.dart';
import '../../../product/model/class_product_model.dart';
import '../../../product/repository/class_product_repo.dart';
import '../../../user/model/user.dart';
import '../../cubit/sales_report/srep_form_cubit.dart';
import '../../model/sale_report_model.dart';
import '../../model/srep_form_model.dart';
import '../widgets/sales_report/finder_salesreport.dart';
import '../widgets/sales_report/listview_sales_report.dart';
import '../widgets/sales_report/pdf_salereport.dart';
import '../widgets/sales_report/time_filter_SRep.dart';

class SalesReportView extends StatelessWidget {
  final bool isLoading;
  final List<SaleReportModel> saleReport;
  final UserModel user;

  const SalesReportView(
      {super.key,
      required this.isLoading,
      required this.saleReport,
      required this.user});

  @override
  Widget build(BuildContext context) {
    List<ClassProductModel> classList = [];
    SRepFormModel form = context.read<SRepFormCubit>().state;
    double total = 0;
    if (form.isTime) {
      for (var sRep in saleReport) {
        total = total + sRep.totalPrice;
      }
    }
    const String TITLE = 'Reporte de ventas';
    return Scaffold(
        backgroundColor: ColorPalette.primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarGlobal(
            title: TITLE,
            iconButton: user.id > -1
                ? IconButtonReturn(
                    iconName: 'return',
                    isLoading: isLoading,
                    route: '/VendorsListController',
                  )
                : null,
          ),
        ),
        body: Column(
          children: [
            Visibility(
              visible: isLoading,
              replacement: const SizedBox(
                height: 4,
              ),
              child: const LinearProgressIndicator(
                color: ColorPalette.primary,
                backgroundColor: ColorPalette.secondaryBackground,
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  // ignore: prefer_const_constructors
                  FinderSalesReport(),
                  // ignore: prefer_const_constructors
                  TimeFilterSRep(),
                  ListviewSalesReport(listData: saleReport),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () async {
                          classList = await ClassProductRepo().getClassList();
                          //classList = await context.read<SalesReportCubit>().getClassList();
                          Uint8List pdfInBytes = await PdfSaleReport()
                              .pdfSalerep(saleReport, form.time, classList);
                          final blob =
                              html.Blob([pdfInBytes], 'application/pdf');
                          final url = html.Url.createObjectUrlFromBlob(blob);
                          final anchor = html.document.createElement('a')
                              as html.AnchorElement
                            ..href = url
                            ..style.display = 'none'
                            ..download = 'reporte_ventas.pdf';
                          html.document.body!.children.add(anchor);
                          anchor.click();
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PdfPreviewSaleReport(
                                        saleReport: saleReport,
                                      )));*/
                        },
                        icon: const Icon(
                          Icons.picture_as_pdf,
                          color: ColorPalette.secondaryBackground,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Total: \$${FormatNumber.format2dec(total)}',
                        style: Typo.bodyText5,
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ),
        bottomNavigationBar: const NavigationBarGlobal(currentIndex: 2));
  }
}
