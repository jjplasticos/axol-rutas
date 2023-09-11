import 'package:axol_rutas/identities/sale/model/sale_report_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';

class PdfSaleReport {
  Future<Uint8List> pdfSalerep(List<SaleReportModel> sRepList, PdfPageFormat format) async {
    final pdf = pw.Document();
    List<pw.Row> content = [];
    for (var element in sRepList) {
      content.add(
          pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Expanded(
          flex: 1,
          child: pw.Center(
            child: pw.Text(element.product.code),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Center(
            child: pw.Text(element.product.type),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Center(
            child: pw.Text(element.product.packing),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Center(
            child: pw.Text(element.product.capacity),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Center(
            child: pw.Text(element.product.measure),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Center(
            child: pw.Text(element.product.gauge),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Center(
            child: pw.Text(element.product.pieces),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Center(
            child: pw.Text(element.quantitySold.toString()),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Center(
            child: pw.Text(element.unitPrice.toString()),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Center(
            child: pw.Text('\$${element.totalPrice}'),
          ),
        ),
      ]));
    }
    //final ByteData bytes = await rootBundle.load('assets/phone.png');
    //final Uint8List byteList = bytes.buffer.asUint8List();
    pdf.addPage(pw.MultiPage(
        header: (context) => pw.Column(children: [
              pw.Header(text: "Reporte de ventas", level: 1),
              pw.Divider(borderStyle: pw.BorderStyle.dashed),
              pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Expanded(
                      flex: 1,
                      child: pw.Center(
                        child: pw.Text('CLAVE'),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Center(
                        child: pw.Text('DESCRIPCION'),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Center(
                        child: pw.Text('GAL'),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Center(
                        child: pw.Text('MEDIDA'),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Center(
                        child: pw.Text('CAL.'),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Center(
                        child: pw.Text('PIEZAS'),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Center(
                        child: pw.Text('CANT. VEND.'),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Center(
                        child: pw.Text('PRECIO UNIT.'),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Center(
                        child: pw.Text('TOTAL POR PRODUCTO'),
                      ),
                    ),
                  ]),
              pw.Divider(borderStyle: pw.BorderStyle.dashed),
            ]),
        footer: (context) => pw.Text('${context.pageNumber}'),
        margin: const pw.EdgeInsets.all(10),
        pageFormat: format, //PdfPageFormat.a4,
        build: (context) {
          return [
            pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: content),
          ];
        }));
    return pdf.save();
  }
}
