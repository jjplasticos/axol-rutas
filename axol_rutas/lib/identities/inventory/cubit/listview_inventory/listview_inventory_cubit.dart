import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/inventory.dart';
import '../../repository/inventory_repo.dart';
import 'listview_inventory_state.dart';

class ListviewInventoryCubit extends Cubit<ListviewInventoryState> {
  ListviewInventoryCubit() : super(InitialState());

  void loadInventory() async {
    try {
      emit(InitialState());
      emit(LoadingState());
      List<InventoryModel> inventory = await FetchInventory().getInventory();
      emit(LoadedState(inventory: inventory));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
