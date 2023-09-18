import 'package:axol_rutas/identities/user/repository/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user/model/user.dart';
import '../../model/inventory.dart';
import '../../repository/inventory_repo.dart';
import 'listview_inventory_state.dart';

class ListviewInventoryCubit extends Cubit<ListviewInventoryState> {
  ListviewInventoryCubit() : super(InitialState());

  void loadInventory() async {
    try {
      emit(InitialState());
      emit(LoadingState());
      UserModel user;
      UserModel vendor;
      UserModel userModel;
      user = await LocalUser().getLocalUser();
      vendor = await LocalUser().getLocalVendor();
      if (user.rol == 'admin') {
        userModel = vendor;
      } else {
        userModel = user;
      }
      List<InventoryModel> inventory = await FetchInventory().getInventory(userModel);
      emit(LoadedState(inventory: inventory));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
