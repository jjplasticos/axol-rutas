import 'package:axol_rutas/identities/user/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/user_repo.dart';
import 'vendors_list_state.dart';

class VendorsListCubit extends Cubit<VendorsListState> {
  VendorsListCubit() : super(InitialState());

  Future<void> load() async {
    try {
      List<UserModel> usersDB = [];
      emit(InitialState());
      emit(LoadingState());
      usersDB = await DatabaseUser().fetchVendors();
      emit(LoadedState(vendors: usersDB));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}