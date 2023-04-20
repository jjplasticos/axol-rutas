import 'package:axol_rutas/identities/shoppingcart/model/shoppingcart_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../inventory/repository/inventory_repo.dart';
import 'options_shppcitem_state.dart';

class OptionsShppcItemCubit extends Cubit<OptionsShppcItemState> {
  OptionsShppcItemCubit() : super(InitialState());

  void edit(List<ShoppingcartItemModel> shoppingcart, int index) async {
    final String stock;
    try {
      emit(InitialState());
      stock = await FetchInventory()
          .getStock(shoppingcart.elementAt(index).product);
      emit(EditState(stock: stock, shoppingcart: shoppingcart, index: index));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  void delete(List<ShoppingcartItemModel> shoppingcart, int index) {
    try {
      emit(InitialState());
      shoppingcart.removeAt(index);
      emit(DeleteState(shoppingcart: shoppingcart, index: index));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  void cancel(List<ShoppingcartItemModel> shoppingcart) {
    try {
      emit(InitialState());
      emit(CancelState(shoppingcart: shoppingcart));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
