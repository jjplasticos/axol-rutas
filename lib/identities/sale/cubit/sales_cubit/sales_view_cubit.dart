import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../user/model/user.dart';
import '../../../user/repository/user_repo.dart';
import '../../model/sale_form_model.dart';
import '../../model/sale_model.dart';
import '../../repository/sale_repo_hive.dart';
import '../../repository/sales_repo.dart';
import 'sales_view_state.dart';

class SalesViewCubit extends Cubit<SalesViewState> {
  SalesViewCubit() : super(InitialState());

  Future<void> load(SaleFormModel form) async {
    try {
      List<SaleModel> salesList = [];
      UserModel localVendor;
      UserModel user;
      UserModel userModel;

      //emit(InitialState());
      emit(LoadingState());

      user = await LocalUser().getLocalUser();
      localVendor = await LocalUser().getLocalVendor();
      if (user.rol == 'admin') {
        userModel = localVendor;
      } else {
        userModel = user;
      }
      salesList = await DatabaseSales().readSalesList(userModel, form);
      //UserModel localVendor = await LocalUser().getLocalVendor();

      SaleRepoHive().initBoxes(userModel, form);

      emit(LoadedState(user: user, salesList: salesList));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  Future<void> init(SaleFormModel form) async {
    try {
      List<SaleModel> salesList = [];
      UserModel localVendor;
      UserModel user;
      UserModel userModel;
      final supabase = Supabase.instance.client;

      //emit(InitialState());
      await supabase.removeAllChannels();
      supabase.channel('public:sales').on(
          RealtimeListenTypes.postgresChanges,
          ChannelFilter(
            event: '*',
            schema: 'public',
            table: 'sales',
          ), (payload, [ref]) {
        print('payload: ${payload.toString()}');
        emit(InitialState());
        //context.read<SalesViewCubit>().load(SaleFormModel.empty());
      }).subscribe();
      emit(LoadingState());

      //DatabaseSales().initRealTime();
      user = await LocalUser().getLocalUser();
      localVendor = await LocalUser().getLocalVendor();
      if (user.rol == 'admin') {
        userModel = localVendor;
      } else {
        userModel = user;
      }
      salesList = await DatabaseSales().readSalesList(userModel, form);
      //UserModel localVendor = await LocalUser().getLocalVendor();

      SaleRepoHive().initBoxes(userModel, form);

      emit(LoadedState(user: user, salesList: salesList));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
