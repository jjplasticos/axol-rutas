import 'package:axol_rutas/identities/user/cubit/login/login_state.dart';
import 'package:axol_rutas/identities/user/cubit/login/password_visibility_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/user.dart';
import '../../repository/user_repo.dart';
import '../auth/auth_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  void checkLogin(String user, String password) async {
    try {
      DatabaseUser databaseUser = DatabaseUser();
      UserModel? loginDatabaseUser = await databaseUser.readDbUser(user);
      if (loginDatabaseUser != null) {
        emit(LoginSuccessState());
      } else {
        emit(LoginFailureState());
      }
    } catch (e) {
      emit(LoginErrorState(error: e.toString()));
    }
  }
}

class PasswordVisibilityCubit extends Cubit<PasswordVisibilityState>{
  PasswordVisibilityCubit() : super(PVIsNotVisibleState());

  void visibility() async {
    try {
      if (state is PVIsNotVisibleState) {
        emit(PVIsVisibleState());
      } else if (state is PVIsVisibleState) {
        emit(PVIsVisibleState());
      }
    } catch (e) {
      emit(PVErrorState(error: e.toString()));
    }
  }
}
