import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/shoppingcart_item.dart';

class ShoppingcartCubit extends Cubit<List<ShoppingcartItemModel>> {
  ShoppingcartCubit() : super([]);

  void returnShoppingcart(List<ShoppingcartItemModel> shoppingcart) {
    emit([]);
    emit(shoppingcart);
  }
}
