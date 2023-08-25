import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../location/repository/location_repo.dart';
import '../../../user/model/user.dart';
import '../../../user/repository/user_repo.dart';
import '../../model/route_customer_model.dart';
import '../../repository/routecustomer_repo.dart';
import 'customer_formview_state.dart';

class CustomerFormviewCubit extends Cubit<CustomerFormviewState> {
  CustomerFormviewCubit() : super(InitialState());

  Future<void> load() async {
    try {
      UserModel vendor;
      emit(InitialState());
      emit(LoadingState());
      vendor = await LocalUser().getLocalUser();
      emit(LoadedState(vendor: vendor.name));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  Future<void> save(String vendor, RouteCustomerModel rc) async {
    try{
      int newId;
      Position position;
      emit(InitialState());
      emit(LoadingState());
      newId = await RoutecustomerRepo().availableId();
      rc.id = newId;
      position = await LocationRepo().determinePosition();
      rc.location = '${position.latitude},${position.longitude}';
      await RoutecustomerRepo().insertRc(rc);
      emit(LoadedState(vendor: vendor));
      emit(SavedState());
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}