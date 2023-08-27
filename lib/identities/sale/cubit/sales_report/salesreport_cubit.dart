import 'package:axol_rutas/identities/sale/model/sale_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/model/product.dart';
import '../../../product/repository/product_repo.dart';
import '../../model/srep_form_model.dart';
import '../../repository/sales_repo.dart';
import 'salesreport_state.dart';

class SalesReportCubit extends Cubit<SalesReportState> {
  SalesReportCubit() : super(InitialState());

  Future<void> load(SRepFormModel form) async {
    try {
      List<SaleModel> salesDB = [];
      List<ProductModel> productsDB = [];
      List<SaleModel> salesList = [];
      List<String> codes = [];
      List items = [];
      SaleModel sale;
      ProductModel product;
      Map<String, dynamic> itemsShppc = {};
      emit(InitialState());
      emit(LoadingState());
      salesDB = await DatabaseSales().readListReport(form);
      for (var element in salesDB) {
        items = element.itemsShppc.values.toList();
        codes.add(items.toString().split('//').first);
      }
      codes = codes.toSet().toList();
      productsDB = await DatabaseProducts().getProductList(codes);
      for (var element in salesDB) {
        final List listItems = element.itemsShppc.values.toList();
        for (int i = 0; i < listItems.length; i++) {
          product = productsDB
              .where((x) =>
                  x.code == listItems.elementAt(i).toString().split('//').first)
              .first;
          itemsShppc[i.toString()] = {0: listItems.elementAt(i), 1: product};
        }
        sale = SaleModel(
          uid: element.uid,
          location: element.location,
          itemsShppc: itemsShppc,
          client: element.client,
          time: element.time,
          totalQuantity: element.totalQuantity,
          totalWeight: element.totalWeight,
          totalPrice: element.totalPrice,
        );
        salesList.add(sale);
      }
      emit(LoadedState(saleList: salesList));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
