import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user/model/user.dart';
import '../../../user/repository/user_repo.dart';
import '../../model/sale_form_model.dart';
import '../../model/sale_model.dart';
import '../../repository/sale_repo_hive.dart';
import 'sales_view_state.dart';

class SalesViewCubit extends Cubit<SalesViewState> {
  SalesViewCubit() : super(InitialState());

  Future<void> load(SaleFormModel form) async {
    try {
      List<SaleModel> salesList = [];
      UserModel localVendor;
      UserModel user;
      UserModel userModel;
      int nSaleNotSync;

      emit(LoadingState());

      user = await LocalUser().getLocalUser();
      localVendor = await LocalUser().getLocalVendor();
      if (user.rol == 'admin') {
        userModel = localVendor;
      } else {
        userModel = user;
      }
      salesList = await SaleRepoHive().fetchSaleList(form);
      nSaleNotSync = await SaleRepoHive().fetchNSaleNotSync();


      emit(LoadedState(user: user, salesList: salesList, nSaleNotSync: nSaleNotSync));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  Future<void> init(SaleFormModel form) async {
    try {
      List<SaleModel> salesList = [];
      UserModel localVendor;
      UserModel user;
      UserModel userModel;
      int nSaleNotSync;

      emit(LoadingState());

      user = await LocalUser().getLocalUser();
      localVendor = await LocalUser().getLocalVendor();
      if (user.rol == 'admin') {
        userModel = localVendor;
      } else {
        userModel = user;
      }
      salesList = await SaleRepoHive().fetchSaleList(form);
      nSaleNotSync = await SaleRepoHive().fetchNSaleNotSync();
      
      emit(LoadedState(user: user, salesList: salesList, nSaleNotSync: nSaleNotSync));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
