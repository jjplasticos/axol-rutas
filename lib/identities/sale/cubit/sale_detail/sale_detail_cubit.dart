import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/model/product.dart';
import '../../../product/repository/product_repo.dart';
import '../../../shoppingcart/model/shoppingcart_models.dart';
import '../../model/sale_model.dart';
import 'sale_detail_state.dart';

class SaleDetailCubit extends Cubit<SaleDetailState> {
  SaleDetailCubit() : super(InitialState());

  Future<void> load(SaleModel sale) async {
    try {
      List<ShoppingcartItemModel> shppc = [];
      ShoppingcartItemModel shppcItem;
      ProductModel? product;
      List codes = sale.products.values.toList();
      String code;

      emit(InitialState());
      emit(LoadingState());
      for (var element in codes) {
        code = element.toString().split('//').first;
        product = await DatabaseProducts().readProduct(code);
        if (product != null) {
          shppcItem = ShoppingcartItemModel(
            product: product,
            quantity: double.parse(element.toString().split('//').elementAt(1)),
            price: double.parse(element.toString().split('//').elementAt(2)),
          );
          shppc.add(shppcItem);
        }
      }  
      emit(LoadedState(shppc: shppc));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
