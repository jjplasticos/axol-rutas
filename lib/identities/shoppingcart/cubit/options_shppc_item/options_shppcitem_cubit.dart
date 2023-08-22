import 'package:axol_rutas/identities/shoppingcart/model/shoppingcart_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../inventory/repository/inventory_repo.dart';
import 'options_shppcitem_state.dart';

class OptionsShppcItemCubit extends Cubit<OptionsShppcItemState> {
  OptionsShppcItemCubit() : super(InitialState());

  /*Future<void> edit(List<ShoppingcartItemModel> shoppingcart, int index) async {
    final String stock;
    try {
      emit(InitialState());
      emit(LoadingState());
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
  }*/

  Future<void> load() async {
    try{
      emit(InitialState());
      emit(LoadingState());
      emit(LoadedState(stock: -1, isGetStock: false));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  Future<void> getStock(
      List<ShoppingcartItemModel> shoppingcart, int index) async {
    try {
      emit(InitialState());
      emit(LoadingState());
      final String stock = await FetchInventory()
          .getStock(shoppingcart.elementAt(index).product);
      final numStock = double.parse(stock);
      emit(LoadedState(stock: numStock, isGetStock: true));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
