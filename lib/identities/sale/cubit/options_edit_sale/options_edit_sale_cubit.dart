import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/sales_repo.dart';
import 'options_edit_sale_state.dart';

class OptionsEditSaleCubit extends Cubit<OptionsEditSaleState> {
  OptionsEditSaleCubit() : super(InitialState());

  Future<void> delete(String id, int step, bool response) async {
    try {
      emit(InitialState());
      switch (step) {
        case 0:
          emit(AskDeleteState(id: id));
          break;
        case 1:
          if (response) {
            emit(DeletingState());
            await DatabaseSales().deleteSale(id);
            emit(DeletedState());
          }
          break;
        default:
      }
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
