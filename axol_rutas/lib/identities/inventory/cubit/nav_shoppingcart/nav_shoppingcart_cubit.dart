import 'package:flutter_bloc/flutter_bloc.dart';

import 'nav_shoppingcart_state.dart';

class NavShoppingcartCubit extends Cubit<NavShoppingcartState> {
  NavShoppingcartCubit() : super(InitialState());

  void pressBtnShoppingcart() async {
    try {
      emit(OpenProductFinderState());
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  void pressBtnSaveShoppingcart() async {
    try {
      emit(SavingShoppingcartState());
      emit(SavedShoppingcartState());
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  void selectProductFinder() async {
    try {
      emit(OpenProductFormState());
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  void pressBtnCancelProductForm() async {
    try {
      emit(CancelProductFormState());
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  void pressBtnSaveProductForm() async {
    try {
      emit(SavingProductFormState());
      emit(SavedProductFormState());
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
