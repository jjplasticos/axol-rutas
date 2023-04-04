import 'package:axol_rutas/identities/sale/cubit/saleslist_state.dart';
import 'package:axol_rutas/identities/sale/model/sale.dart';
import 'package:axol_rutas/identities/sale/repository/sales_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesListCubit extends Cubit<SalesListState> {
  SalesListCubit() : super(SListInitialState());

  void getSalesList() async {
    try {
      emit(SListLoadingState());
      DatabaseSales databaseSales = DatabaseSales();
      final List<SaleModel> salesList = await databaseSales.readSalesList();
      emit(SListLoadedState(salesList: salesList));
    } catch (e) {
      print('Entró aquí ');
      emit(SListErrorState(error: e.toString()));
    }
  }
}
