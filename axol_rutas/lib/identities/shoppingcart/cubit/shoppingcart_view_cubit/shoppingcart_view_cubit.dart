import 'package:flutter_bloc/flutter_bloc.dart';

import 'shoppingcart_view_state.dart';

class ShoppingcartViewCubit extends Cubit<ShoppingcartViewState> {
  ShoppingcartViewCubit() : super(InitialState());

  Future<void> load(String customerName) async {
    try {
      emit(InitialState());
      emit(LoadingState());
      emit(LoadedState(customerName: customerName));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}