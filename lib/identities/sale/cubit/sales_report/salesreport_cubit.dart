import 'package:axol_rutas/identities/sale/model/sale_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/model/class_product_model.dart';
import '../../../product/model/product.dart';
import '../../../product/repository/class_product_repo.dart';
import '../../../product/repository/product_repo.dart';
import '../../../user/model/user.dart';
import '../../../user/repository/user_repo.dart';
import '../../model/sale_report_model.dart';
import '../../model/srep_form_model.dart';
import '../../repository/sales_repo.dart';
import 'salesreport_state.dart';

class SalesReportCubit extends Cubit<SalesReportState> {
  SalesReportCubit() : super(InitialState());

  Future<void> load(SRepFormModel form) async {
    try {
      List<SaleModel> salesDB = [];
      List<ProductModel> productsDB = [];
      List<String> codes = [];
      List items = [];
      ProductModel product;
      List itemsShppc = [];
      List<SaleReportModel> sRepList = [];
      SaleReportModel saleReport;
      List<String> item;
      int index = -1;
      final String finder = form.finder.text.toLowerCase();
      List<SaleReportModel> finalSRepList = [];
      UserModel user;
      UserModel vendor;
      UserModel userModel;
      bool flag;

      emit(InitialState());

      user = await LocalUser().getLocalUser();
      vendor = await LocalUser().getLocalVendor();
      if (user.rol == 'admin') {
        userModel = vendor;
      } else {
        userModel = user;
      }
      emit(LoadingState(user: vendor));
      //Obtiene lista de ventas.
      salesDB = await DatabaseSales().readListReport(form, userModel);
      //Crea una lista de claves de todos los items de todas las ventas.-
      for (var saleIn in salesDB) {
        items = saleIn.itemsShppc.values.toList();
        for (var itemIn in items) {
          codes.add(itemIn.toString().split('//').first);
        }
      }
      //Elimina las claves repetidas y obtiene la lista de los productos.
      codes = codes.toSet().toList();
      productsDB = await DatabaseProducts().getProductList(codes);
      //print(productsDB);
      //Por cada item de los shoppingcart de cada centa de la lista...
      for (var saleIn in salesDB) {
        itemsShppc = saleIn.itemsShppc.values.toList();
        for (var itemIn in itemsShppc) {
          item = itemIn.toString().split('//');
          //si la lista de reporte de ventas no contiene la clave y no es la misma cantidad...
          final sRepListWhere =
              sRepList.where((x) => x.product.code == item[0]);
          if (sRepListWhere.isNotEmpty) {
            //0.1.0
            //if (sRepList.where((x) => x.product.code == item[0]).isNotEmpty) {
            ////index = sRepList.indexWhere((x) => x.product.code == item[0]); //<--- prblema aquí
            //Errro detectado: verifica si sRepList ya tiene la clave de item, pero no si es el mismo precio.
            flag = false;
            for (var i = 0; i < sRepListWhere.length; i++) {
              if (sRepListWhere.elementAt(i).unitPrice ==
                  double.parse(item[3])) {
                flag = true;
                index = i;
              }
            }
            if (flag) {
              //if (sRepList.elementAt(index).unitPrice == double.parse(item[3])) { //Version 0.1.0
              //Suma la cantidad de itemShppc a la cantidad del item del reporte de ventas.
              sRepList[index].quantitySold =
                  sRepList[index].quantitySold + double.parse(item[1]);
              sRepList[index].totalPrice =
                  sRepList[index].quantitySold * sRepList[index].unitPrice;
            } else {
              //Si no, crea e inserta un nuevo item para el reporte de ventas.
              product = productsDB.where((x) => x.code == item.first).first;
              saleReport = SaleReportModel(
                product: product,
                dateTime:
                    DateTime.fromMillisecondsSinceEpoch(int.parse(saleIn.time)),
                quantitySold: double.parse(item[1]),
                unitPrice: double.parse(item[3]),
                totalPrice: double.parse(item[1]) * double.parse(item[3]),
              );
              sRepList.add(saleReport);
            }
          } else {
            product = productsDB.where((x) => x.code == item.first).first;
            saleReport = SaleReportModel(
              product: product,
              dateTime:
                  DateTime.fromMillisecondsSinceEpoch(int.parse(saleIn.time)),
              quantitySold: double.parse(item[1]),
              unitPrice: double.parse(item[3]),
              totalPrice: double.parse(item[1]) * double.parse(item[3]),
            );
            sRepList.add(saleReport);
          }
        }
      }
      if (finder != '') {
        for (var element in sRepList) {
          if (element.product.capacity.toLowerCase() == finder ||
              element.product.code.toLowerCase() == finder ||
              element.product.description.toLowerCase() == finder ||
              element.product.gauge.toLowerCase() == finder ||
              element.product.measure.toLowerCase() == finder ||
              element.product.packing.toLowerCase() == finder ||
              element.product.pieces.toLowerCase() == finder ||
              element.product.type.toLowerCase() == finder ||
              element.product.weight.toLowerCase() == finder) {
            finalSRepList.add(element);
          }
        }
      } else {
        finalSRepList = sRepList;
      }
      emit(LoadedState(saleReport: finalSRepList, user: vendor));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  Future<List<ClassProductModel>> getClassList() async {
    List<ClassProductModel> classList;
    classList = await ClassProductRepo().getClassList();
    return classList;
  }
}
