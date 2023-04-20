import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/shoppingcart_models.dart';

class ShoppingcartCubit extends Cubit<ShoppingcartResultsModel> {
  final ShoppingcartResultsModel initialState = ShoppingcartResultsModel(
      shoppingcart: [], totalQuantity: 0, totalPrice: 0, totalWeight: 0);

  ShoppingcartCubit()
      : super(ShoppingcartResultsModel(
            shoppingcart: [], totalQuantity: 0, totalPrice: 0, totalWeight: 0));

  void returnShoppingcart(List<ShoppingcartItemModel> shoppingcart) {
    emit(initialState);
    final ShoppingcartResultsModel shoppingcartResults;
    double totalPrice = 0;
    double totalQuantity = 0;
    double totalWeight = 0;
    for (var element in shoppingcart) {
      totalPrice = totalPrice + (element.price * element.quantity);
      totalQuantity = totalQuantity + element.quantity;
      totalWeight = totalWeight +
          (element.quantity * double.parse(element.product.weight));
    }
    shoppingcartResults = ShoppingcartResultsModel(
        shoppingcart: shoppingcart,
        totalQuantity: totalQuantity,
        totalPrice: totalPrice,
        totalWeight: totalWeight);

    emit(shoppingcartResults);
  }
}
