import 'package:axol_rutas/identities/sale/model/sale_report_model.dart';
import 'package:axol_rutas/identities/user/model/user.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';

import '../../../../../settings/format.dart';
import '../../../../../settings/theme.dart';
import '../../../../user/repository/user_repo.dart';

class PdfSaleReport {
  final pw.TextStyle _subtitle =
      pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold);
  final pw.TextStyle _body =
      pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.normal);

  Future<Uint8List> pdfSalerep(
      List<SaleReportModel> sRepList, DateTime date) async {
    final pdf = pw.Document();
    final UserModel user = await LocalUser().getLocalUser();
    List<pw.Widget> content = [];
    double total = 0;
    for (var element in sRepList) {
      total = total + element.totalPrice;
      content.add(
          pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Expanded(
          flex: 1,
          child: pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(element.product.code, style: _body),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(element.product.packing, style: _body),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(element.product.capacity, style: _body),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(element.product.measure, style: _body),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(element.product.gauge, style: _body),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(element.product.pieces, style: _body),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(element.quantitySold.toString(), style: _body),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Align(
            alignment: pw.Alignment.centerRight,
            child: pw.Text('\$${FormatNumber.format2dec2(element.unitPrice)}', style: _body),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Align(
            alignment: pw.Alignment.centerRight,
            child: pw.Text('\$${FormatNumber.format2dec2(element.totalPrice)}', style: _body),
          ),
        ),
      ]));
    }
    content.add(pw.Divider(thickness: 0.1, borderStyle: pw.BorderStyle.solid));
    content.add(pw.Row(
      mainAxisAlignment:pw.MainAxisAlignment.end,
      children: [
        //pw.Expanded(child: pw.SizedBox()),
        pw.Text('IMPORTE TOTAL: \$${FormatNumber.format2dec2(total)}', style: _body),
        //pw.SizedBox(width: 16),
      ]
    ));

    //final ByteData bytes = await rootBundle.load('assets/phone.png');
    //final Uint8List byteList = bytes.buffer.asUint8List();
    pdf.addPage(pw.MultiPage(
        header: (context) => pw.Column(children: [
              pw.Header(
                  level: 3,
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                      children: [
                        pw.Text('REPORTE DE VENTAS', style: _subtitle),
                        pw.Text('FECHA: ${date.day}/${date.month}/${date.year}',
                            style: _subtitle),
                        pw.Text('VENDEDOR: ${user.name}', style: _subtitle)
                      ])),
              /*pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                  children: [
                    pw.Text('FECHA: ${date.day}/${date.month}/${date.year}',
                        style: _subtitle),
                    pw.Text('VENDEDOR: ${user.name}', style: _subtitle)
                  ]),*/
              pw.Divider(
                thickness: 1,
                borderStyle: pw.BorderStyle.solid,
                ),
              pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Expanded(
                      flex: 1,
                      child: pw.Align(
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text('CLAVE', style: _subtitle),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Align(
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text('EMPAQUE', style: _subtitle),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Align(
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text('GAL', style: _subtitle),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Align(
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text('MEDIDA', style: _subtitle),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Align(
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text('CAL.', style: _subtitle),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Align(
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text('PIEZAS', style: _subtitle),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Align(
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text('CANT. VEN.', style: _subtitle),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Align(
                        alignment: pw.Alignment.centerRight,
                        child: pw.Text('PRECIO', style: _subtitle),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Align(
                        alignment: pw.Alignment.centerRight,
                        child: pw.Text('IMPORTE', style: _subtitle),
                      ),
                    ),
                  ]),
              pw.Divider(
                thickness: 0.5,
                borderStyle: pw.BorderStyle.solid,
                ),
            ]),
        footer: (context) => pw.Text('${context.pageNumber}'),
        margin: const pw.EdgeInsets.all(10),
        pageFormat: PdfPageFormat.a4, //PdfPageFormat.a4,
        build: (context) {
          return [
            pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: content
                ),
          ];
        }
        ));
    return pdf.save();
  }
}
