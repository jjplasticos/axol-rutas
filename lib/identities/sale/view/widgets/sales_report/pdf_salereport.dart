import 'package:axol_rutas/identities/sale/model/sale_report_model.dart';
import 'package:axol_rutas/identities/user/model/user.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';

import '../../../../../settings/format.dart';
import '../../../../product/model/class_product_model.dart';
import '../../../../user/repository/user_repo.dart';

class PdfSaleReport {
  final pw.TextStyle _subtitle =
      pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold);
  final pw.TextStyle _body =
      pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.normal);

  Future<Uint8List> pdfSalerep(List<SaleReportModel> sRepList, DateTime date,
      List<ClassProductModel> classList) async {
    final pdf = pw.Document();
    final UserModel localUser = await LocalUser().getLocalUser();
    final UserModel localVendor = await LocalUser().getLocalVendor();
    final UserModel user;
    List<pw.Widget> content = [];
    double total = 0;
    double subtotal = 0;
    List<int> classNumList = [];
    String className;
    Map<String, Map<int, dynamic>> typeMap = {};
    List<SaleReportModel> sRepsInMap = [];

    if (localUser.rol == 'admin') {
      user = localVendor;
    } else {
      user = localUser;
    }
    for (var sRep in sRepList) {
      total = total + sRep.totalPrice;
      if (classNumList.contains(sRep.product.class_) == false) {
        classNumList.add(sRep.product.class_);
      }
      /*if (typeList.contains(sRep.saleType) == false) {
        typeList.add(sRep.saleType);
      }*/
      if (typeMap.keys.contains(sRep.saleType) == false) {
        sRepsInMap = [];
        subtotal = 0;
        for (var sRepIn in sRepList) {
          if (sRepIn.saleType == sRep.saleType) {
            subtotal = subtotal + sRepIn.totalPrice;
            sRepsInMap.add(sRepIn);
          }
        }
        typeMap[sRep.saleType] = {0: sRepsInMap, 1: subtotal};
      }
    }

    typeMap.forEach((key, value) {
      content.add(pw.Text(key));
      for (var num in classNumList) {
        //Agrega división de clase de producto
        className = classList.where((x) => x.id == num).first.text1;
        content
            .add(pw.Divider(thickness: 0.1, borderStyle: pw.BorderStyle.solid));
        content.add(
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
          pw.Text(className, style: _body),
        ]));
        content.add(pw.SizedBox(height: 4));
        for (var sRep2 in value[0]) {
          if (sRep2.product.class_ == num) {
            //Agrega producto
            content.add(pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Expanded(
                    flex: 1,
                    child: pw.Align(
                      alignment: pw.Alignment.centerLeft,
                      child: pw.Text(sRep2.product.code, style: _body),
                    ),
                  ),
                  pw.Expanded(
                    flex: 1,
                    child: pw.Align(
                      alignment: pw.Alignment.centerLeft,
                      child: pw.Text(sRep2.product.packing, style: _body),
                    ),
                  ),
                  pw.Expanded(
                    flex: 1,
                    child: pw.Align(
                      alignment: pw.Alignment.centerLeft,
                      child: pw.Text(sRep2.product.capacity, style: _body),
                    ),
                  ),
                  pw.Expanded(
                    flex: 1,
                    child: pw.Align(
                      alignment: pw.Alignment.centerLeft,
                      child: pw.Text(sRep2.product.measure, style: _body),
                    ),
                  ),
                  pw.Expanded(
                    flex: 1,
                    child: pw.Align(
                      alignment: pw.Alignment.centerLeft,
                      child: pw.Text(sRep2.product.gauge, style: _body),
                    ),
                  ),
                  pw.Expanded(
                    flex: 1,
                    child: pw.Align(
                      alignment: pw.Alignment.centerLeft,
                      child: pw.Text(sRep2.product.pieces, style: _body),
                    ),
                  ),
                  pw.Expanded(
                    flex: 1,
                    child: pw.Center(
                      child:
                          pw.Text(sRep2.quantitySold.toString(), style: _body),
                    ),
                  ),
                  pw.Expanded(
                    flex: 1,
                    child: pw.Align(
                      alignment: pw.Alignment.centerRight,
                      child: pw.Text(
                          '\$${FormatNumber.format2dec2(sRep2.unitPrice)}',
                          style: _body),
                    ),
                  ),
                  pw.Expanded(
                    flex: 1,
                    child: pw.Align(
                      alignment: pw.Alignment.centerRight,
                      child: pw.Text(
                          '\$${FormatNumber.format2dec2(sRep2.totalPrice)}',
                          style: _body),
                    ),
                  ),
                ]));
          }
        }
      }
      content
          .add(pw.Divider(thickness: 0.1, borderStyle: pw.BorderStyle.solid));
      content
          .add(pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
        pw.Text('IMPORTE: \$${FormatNumber.format2dec2(value[1])}',
            style: _body),
      ]));
      content.add(pw.SizedBox(height: 16));
    });
    content.add(pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
      pw.Text('IMPORTE TOTAL: \$${FormatNumber.format2dec2(total)}', style: _body),
    ]));

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
                      child: pw.Center(
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
              /*pw.Divider(
                thickness: 0.5,
                borderStyle: pw.BorderStyle.solid,
                ),*/
            ]),
        footer: (context) => pw.Text('${context.pageNumber}'),
        margin: const pw.EdgeInsets.all(10),
        pageFormat: PdfPageFormat.a4, //PdfPageFormat.a4,
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
