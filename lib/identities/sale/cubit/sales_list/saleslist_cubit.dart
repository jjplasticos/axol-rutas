import 'package:axol_rutas/identities/sale/model/sale_model.dart';
import 'package:axol_rutas/identities/sale/repository/sales_repo.dart';
import 'package:axol_rutas/identities/user/repository/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user/model/user.dart';
import 'saleslist_state.dart';

class SalesListCubit extends Cubit<SalesListState> {
  SalesListCubit() : super(SListInitialState());

  Future<void> getSalesList(String filter) async {
    try {
      //emit(SListInitialState());
      emit(SListLoadingState());
      List<SaleModel> salesList = [];
      UserModel localVendor;
      UserModel user;
      UserModel userModel;
      user = await LocalUser().getLocalUser();
      localVendor = await LocalUser().getLocalVendor();
      if (user.rol == 'admin') {
        userModel = localVendor;
      } else {
        userModel = user;
      }
      salesList = await DatabaseSales().readSalesList(filter, userModel);
      emit(SListLoadedState(salesList: salesList));
      //print('${localVendor.id}:${localVendor.name}:${salesList.length}');
    } catch (e) {
      emit(SListErrorState(error: e.toString()));
    }
  }
}
