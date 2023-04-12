import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/model/product.dart';
import '../../repository/inventory_repo.dart';
import 'save_products_state.dart';

class SaveProductsCubit extends Cubit<SaveProductsState> {
  SaveProductsCubit() : super(InitialState());

  void save(ProductModel productModel, String quantity, String price,
      String weight) async {
    try {
      emit(SavingState());
      LocalShoppingcart().writeShoppingCart(productModel,
          double.parse(quantity), double.parse(price), double.parse(weight));
      emit(SavedState());
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
