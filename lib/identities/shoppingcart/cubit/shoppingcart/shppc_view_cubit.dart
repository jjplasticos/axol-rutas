import 'package:flutter_bloc/flutter_bloc.dart';

import 'shppc_view_state.dart';

class ShppcViewCubit extends Cubit<ShppcViewState> {
  ShppcViewCubit() : super(InitialState());

  Future<void> load(String customerName) async {
    try {
      emit(InitialState());
      emit(LoadingState());
      emit(LoadedState());
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}