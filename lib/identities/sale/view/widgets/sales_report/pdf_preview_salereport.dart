import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';

class PdfPreviewSaleReport extends StatelessWidget {
  //final PdfPreview pdfPreview;
  final FutureOr<Uint8List> makePdf;

  const PdfPreviewSaleReport({super.key, required this.makePdf});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
      body: PdfPreview(build: (context) => makePdf),
    );
  }
}