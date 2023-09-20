import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user/model/user.dart';
import '../../../user/repository/user_repo.dart';
import 'inv_product_view_state.dart';

class InvProductViewCubit extends Cubit<InvProductViewState> {
  InvProductViewCubit() : super(InitialState());

  void load() async {
    try {
      emit(InitialState());
      emit(LoadingState());
      UserModel user = await LocalUser().getLocalUser();
      emit(LoadedState(user: user));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}