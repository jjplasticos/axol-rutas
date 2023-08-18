import 'package:flutter_bloc/flutter_bloc.dart';

import 'shppcitem_view_state.dart';

class ShppcitemViewCubit extends Cubit<ShppcitemViewState> {
  ShppcitemViewCubit() : super(InitialState());

  Future<void> load() async {
    try {
      emit(InitialState());
      emit(LoadingState());
      emit(LoadedState());
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}