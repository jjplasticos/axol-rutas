import 'package:axol_rutas/identities/user/cubit/login/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../location/repository/location_repo.dart';
import '../../../../shoppingcart/model/route_customer_model.dart';
import '../../../model/user.dart';
import '../../../repository/user_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialState());

  Future<void> checkLogin(String user, String password) async {
    try {
      emit(InitialState());
      DatabaseUser databaseUser = DatabaseUser();
      LocalUser localUser = LocalUser();
      UserModel? loginDatabaseUser = await databaseUser.readDbUser(user);
      if (loginDatabaseUser != null) {
        if (loginDatabaseUser.name == user &&
            loginDatabaseUser.password == password) {
          emit(SuccessState(user: loginDatabaseUser));
          localUser.setLocalUser(loginDatabaseUser.name, loginDatabaseUser.rol,
              loginDatabaseUser.id);
        } else {
          emit(FailureState());
        }
      } else {
        emit(FailureState());
      }
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  Future<void> load() async {
    try {
      emit(InitialState());
      emit(LoadingState());
      emit(LoadedState());
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  Future<void> test(int testNumber) async {
    try {
      emit(InitialState());
      Position position;
      String location;
      position = await LocationRepo().determinePosition();
      location = '${position.latitude},${position.longitude}';
      emit(TestState(testNumber: testNumber, testText: location));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
