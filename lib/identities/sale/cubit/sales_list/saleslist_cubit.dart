import 'package:axol_rutas/identities/sale/model/sale_model.dart';
import 'package:axol_rutas/identities/sale/repository/sales_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'saleslist_state.dart';

class SalesListCubit extends Cubit<SalesListState> {
  SalesListCubit() : super(SListInitialState());

  void getSalesList(String filter) async {
    try {
      emit(SListInitialState());
      emit(SListLoadingState());
      DatabaseSales databaseSales = DatabaseSales();
      List<SaleModel> salesList = await databaseSales.readSalesList(filter);
      emit(SListLoadedState(salesList: salesList));
    } catch (e) {
      emit(SListErrorState(error: e.toString()));
    }
  }
}
