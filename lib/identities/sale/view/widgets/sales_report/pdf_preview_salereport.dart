import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';

import '../../../model/sale_report_model.dart';
import 'pdf_salereport.dart';

class PdfPreviewSaleReport extends StatelessWidget {
  //final PdfPreview pdfPreview;
  //final FutureOr<Uint8List> makePdf;
  final List<SaleReportModel> saleReport;

  const PdfPreviewSaleReport({
    super.key,
    //required this.makePdf,
    required this.saleReport,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
      body: PdfPreview(
          build: (format) => PdfSaleReport().pdfSalerep(saleReport, format),
              ),
    );
  }
}
