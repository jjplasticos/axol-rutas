import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/inventory_repo.dart';
import 'lists_products_state.dart';

class ProductsListCubit extends Cubit<ListsProductsState> {
  ProductsListCubit() : super(InitialState());

  void productsInventory() async {
    try {
      emit(LoadingState());
      DatabaseInventory databaseInventory = DatabaseInventory();
      final List<Map<String, String>> productsList =
          await databaseInventory.readInventoryProducts();
      emit(LoadedState(inventoryProducts: productsList));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  void productsShoppingCart() async {
    try {
      emit(LoadingState());
      emit(LoadedState(inventoryProducts: []));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
