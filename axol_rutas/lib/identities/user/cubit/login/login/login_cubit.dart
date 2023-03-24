import 'package:axol_rutas/identities/user/cubit/login/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/user.dart';
import '../../../repository/user_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  void checkLogin(String user, String password) async {
    try {
      emit(LoginInitialState());
      DatabaseUser databaseUser = DatabaseUser();
      UserModel? loginDatabaseUser = await databaseUser.readDbUser(user);
      if (loginDatabaseUser != null) {
        if (loginDatabaseUser.name == user &&
            loginDatabaseUser.password == password) {
          emit(LoginSuccessState(user: loginDatabaseUser));
        } else {
          emit(LoginFailureState());
        }
      } else {
        emit(LoginFailureState());
      }
    } catch (e) {
      emit(LoginErrorState(error: e.toString()));
    }
  }
}
