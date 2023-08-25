import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shoppingcart/model/shoppingcart_models.dart';
import '../../model/sale_model.dart';
import 'sale_detail_state.dart';

class SaleDetailCubit extends Cubit<SaleDetailState> {
  SaleDetailCubit() : super(InitialState());

  Future<void> load(SaleModel sale) async {
    try {
      List<ShoppingcartItemModel> shppc = [];

      emit(InitialState());
      emit(LoadingState());
      emit(LoadedState(shppc: shppc));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
