import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user/model/user.dart';
import '../../../user/repository/user_repo.dart';
import '../../model/inventory_form_model.dart';
import '../../model/inventory_model.dart';
import '../../repository/inventory_repo.dart';
import 'inventory_view_state.dart';

class InventoryViewCubit extends Cubit<InventoryViewState> {
  InventoryViewCubit() : super(InitialState());

  void load(InventoryFormModel form) async {
    try {
      emit(InitialState());
      UserModel user;
      UserModel vendor;
      UserModel userModel;
      List<InventoryModel> inventory;
      user = await LocalUser().getLocalUser();
      vendor = await LocalUser().getLocalVendor();
      if (user.rol == 'admin') {
        userModel = vendor;
      } else {
        userModel = user;
      }
      emit(LoadingState(user: vendor));
      inventory = await FetchInventory().getInventory(userModel, form.finder.text);
      emit(LoadedState(user: vendor, inventory: inventory));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}