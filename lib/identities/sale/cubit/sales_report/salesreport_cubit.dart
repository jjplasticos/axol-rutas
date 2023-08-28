import 'package:axol_rutas/identities/sale/model/sale_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/model/product.dart';
import '../../../product/repository/product_repo.dart';
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
      int index;

      emit(InitialState());
      emit(LoadingState());
      //Obtiene lista de ventas.
      salesDB = await DatabaseSales().readListReport(form);
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
      //Por cada item de los shoppingcart de cada centa de la lista...
      for (var saleIn in salesDB) {
        itemsShppc = saleIn.itemsShppc.values.toList();
        for (var itemIn in itemsShppc) {
          item = itemIn.toString().split('//');
          //si la lista de reporte de ventas no contiene la clave y no es la misma cantidad...
          if (sRepList.where((x) => x.product.code == item[0]).isNotEmpty) {
            index = sRepList.indexWhere((x) => x.product.code == item[0]);
            if (sRepList.elementAt(index).unitPrice == int.parse(item[3])) {
              //Suma la cantidad de itemShppc a la cantidad del item del reporte de ventas.
              sRepList[index].quantitySold = sRepList[index].quantitySold + int.parse(item[1]);
              sRepList[index].totalPrice = sRepList[index].quantitySold * sRepList[index].unitPrice;
            } else {
              //Si no, crea e inserta un nuevo item para el reporte de ventas.
              product = productsDB.where((x) => x.code == item.first).first;
              saleReport = SaleReportModel(
                product: product, 
                dateTime: DateTime.fromMillisecondsSinceEpoch(int.parse(saleIn.time)), 
                quantitySold: int.parse(item[1]), 
                unitPrice: int.parse(item[3]), 
                totalPrice: int.parse(item[1] * int.parse(item[3])),
                );
              sRepList.add(saleReport);
            }
          } else {
            product = productsDB.where((x) => x.code == item.first).first;
              saleReport = SaleReportModel(
                product: product, 
                dateTime: DateTime.fromMillisecondsSinceEpoch(int.parse(saleIn.time)), 
                quantitySold: int.parse(item[1]), 
                unitPrice: int.parse(item[3]), 
                totalPrice: int.parse(item[1] * int.parse(item[3])),
                );
              sRepList.add(saleReport);
          }
        }
      }
    
      emit(LoadedState(saleReport: sRepList));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
