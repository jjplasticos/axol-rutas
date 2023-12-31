import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../user/model/user.dart';
import '../../../user/repository/user_repo.dart';

/*class PdfInventory {
  final pw.TextStyle _subtitle =
      pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold);
  final pw.TextStyle _body =
      pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.normal);

  Future<Uint8List> pdfCheckInventory(UserModel vendor) async {
    final pdf = pw.Document();
    //final UserModel user = await LocalUser().getLocalUser();
    List<pw.Widget> content = [];
    DateTime date = DateTime.now();
    //double total = 0;
    //List<int> classNumList = [];
    //String className;
    for (var sRep in sRepList) {
      total = total + sRep.totalPrice;
      if (classNumList.contains(sRep.product.class_) == false) {
        classNumList.add(sRep.product.class_);
      }
    }
    for (var num in classNumList) {
      className = classList.where((x) => x.id == num).first.text1;
      content.add(pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: [
          pw.Text(className, style: _body),
        ]
      ));
      content.add(pw.Divider(thickness: 0.1, borderStyle: pw.BorderStyle.solid));
      for (var sRep2 in sRepList) {
        if (sRep2.product.class_ == num) {
          content.add(
            pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
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
            child: pw.Text(sRep2.quantitySold.toString(), style: _body),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Align(
            alignment: pw.Alignment.centerRight,
            child: pw.Text('\$${FormatNumber.format2dec2(sRep2.unitPrice)}', style: _body),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Align(
            alignment: pw.Alignment.centerRight,
            child: pw.Text('\$${FormatNumber.format2dec2(sRep2.totalPrice)}', style: _body),
          ),
        ),
      ])
          );
        }
      }
    }
    content.add(pw.Divider(thickness: 0.1, borderStyle: pw.BorderStyle.solid));
    content.add(pw.Row(
      mainAxisAlignment:pw.MainAxisAlignment.end,
      children: [
        pw.Text('IMPORTE TOTAL: \$${FormatNumber.format2dec2(total)}', style: _body),
      ]
    ));

    pdf.addPage(pw.MultiPage(
        header: (context) => pw.Column(children: [
              pw.Header(
                  level: 3,
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                      children: [
                        pw.Text('REVISIÓN DE INVENTARIO', style: _subtitle),
                        pw.Text('FECHA: ${date.day}/${date.month}/${date.year}',
                            style: _subtitle),
                        pw.Text('VENDEDOR: ${vendor.name}', style: _subtitle)
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
                        child: pw.Text('DESCRIPCION', style: _subtitle),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Align(
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text('INVENTARIO', style: _subtitle),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Align(
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text('FISICO', style: _subtitle),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Align(
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text('DIFERENCIA', style: _subtitle),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Align(
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text('ESTADO', style: _subtitle),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Center(
                        child: pw.Text('', style: _subtitle),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Align(
                        alignment: pw.Alignment.centerRight,
                        child: pw.Text('', style: _subtitle),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Align(
                        alignment: pw.Alignment.centerRight,
                        child: pw.Text('', style: _subtitle),
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
}*/