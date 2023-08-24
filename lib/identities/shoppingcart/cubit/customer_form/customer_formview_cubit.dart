import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user/model/user.dart';
import '../../../user/repository/user_repo.dart';
import 'customer_formview_state.dart';

class CustomerFormviewCubit extends Cubit<CustomerFormviewState> {
  CustomerFormviewCubit() : super(InitialState());

  Future<void> load() async {
    try {
      UserModel vendor;
      String txtVendor;
      emit(InitialState());
      emit(LoadingState());
      vendor = await LocalUser().getLocalUser();
      emit(LoadedState());
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}