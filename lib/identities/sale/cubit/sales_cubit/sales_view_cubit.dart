import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user/model/user.dart';
import '../../../user/repository/user_repo.dart';
import 'sales_view_state.dart';

class SalesViewCubit extends Cubit<SalesViewState> {
  SalesViewCubit() : super(InitialState());

  Future<void> load() async {
    try {
      emit(InitialState());
      emit(LoadingState());
      UserModel localVendor = await LocalUser().getLocalVendor();
      emit(LoadedState(vendor: localVendor));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}