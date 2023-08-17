// ignore_for_file: constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/model/product.dart';
import '../../model/shoppingcart_models.dart';
import 'save_shppc_item_state.dart';

class SaveShppcItemCubit extends Cubit<SaveShppcItemState> {
  SaveShppcItemCubit() : super(InitialState());

  void runVerification(
      String quantity,
      String price,
      double stock,
      List<ShoppingcartItemModel> shoppingcart,
      ProductModel product,
      int index,
      int act) {
    const String MESSAGE1 = 'No puede ingresar una canitdad mayor al stock.';
    const String MESSAGE2 = 'Valor de cantidad invalido.';
    const String MESSAGE3 = 'Valor de precio invalido.';
    ShoppingcartItemModel shoppingcartItem;
    try {
      emit(InitialState());
      final double? numQuantity = double.tryParse(quantity);
      final double? numPrice = double.tryParse(price);
      if (numQuantity != null) {
        if (numPrice != null) {
          shoppingcartItem = ShoppingcartItemModel(
              product: product, quantity: numQuantity, price: numPrice);
          switch (act) {
            case 0:
              {
                shoppingcart.add(shoppingcartItem);
              }
              break;
            case 1:
              {
                shoppingcart.removeAt(index);
                shoppingcart.insert(index, shoppingcartItem);
              }
              break;
          }
          if (numQuantity > stock) {
            emit(EntryFailure(errorMessage: MESSAGE1));
          } else {
            emit(EntrySucces(shoppingcart: shoppingcart));
          }
        } else {
          emit(EntryFailure(errorMessage: MESSAGE3));
        }
      } else {
        emit(EntryFailure(errorMessage: MESSAGE2));
      }
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
