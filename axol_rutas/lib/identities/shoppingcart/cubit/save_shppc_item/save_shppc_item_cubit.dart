// ignore_for_file: constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';

import 'save_shppc_item_state.dart';

class SaveShppcItemCubit extends Cubit<SaveShppcItemState> {
  SaveShppcItemCubit() : super(InitialState());

  void runVerification(double quantity, double stock) {
    const String MESSAGE1 = 'No puede ingresar una canitdad mayor al stock.';
    try {
      emit(InitialState());
      if (stock > quantity) {
        emit(EntryFailure(errorMessage: MESSAGE1));
      } else {
        emit(EntrySucces());
      }
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
