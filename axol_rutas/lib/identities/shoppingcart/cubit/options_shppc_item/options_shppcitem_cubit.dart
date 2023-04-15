import 'package:axol_rutas/identities/product/model/product.dart';
import 'package:axol_rutas/identities/shoppingcart/model/shoppingcart_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/inventory_repo.dart';
import 'options_shppcitem_state.dart';

class OptionsShppcItemCubit extends Cubit<OptionsShppcItemState> {
  OptionsShppcItemCubit() : super(InitialState());

  void edit(List<ShoppingcartItemModel> shoppingcart, int index) async {
    final String stock;
    try {
      emit(InitialState());
      stock = await DatabaseProductFinder()
          .getStock(shoppingcart.elementAt(index).product);
      emit(EditState(stock: stock, shoppingcart: shoppingcart, index: index));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  void delete() {
    try {
      emit(InitialState());
      emit(DeleteState());
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  void cancel() {
    try {
      emit(InitialState());
      emit(CancelState());
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
