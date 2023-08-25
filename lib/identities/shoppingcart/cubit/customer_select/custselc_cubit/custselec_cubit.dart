import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/route_customer_model.dart';
import '../../../repository/routecustomer_repo.dart';
import 'custselec_state.dart';

class CustselecCubit extends Cubit<CustselecState> {
  CustselecCubit() : super(InitialState());

  Future<void> load(String inText, List<RouteCustomerModel> currentList) async {
    try {
      List<RouteCustomerModel> rcListDB;
      emit(InitialState());
      emit(LoadingState(rcList: currentList));
      rcListDB = await RoutecustomerRepo().fetchRcList(inText);
      rcListDB.sort((a, b) => a.id.compareTo(b.id));
      emit(LoadedState(rcList: rcListDB));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}