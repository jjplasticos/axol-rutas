import 'package:axol_rutas/identities/user/cubit/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/user.dart';
import '../../repository/user_repo.dart';
import '../auth/auth_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  void checkLogin(String user, String password) async {
    emit(LoginFailureState());
    /*try {
      DatabaseUser databaseUser = DatabaseUser();
      UserModel? loginDatabaseUser = await databaseUser.readDbUser(user);
      if (loginDatabaseUser != null) {
        emit(LoginSuccessState());
      } else {
        emit(LoginFailureState());
      }
    } catch (e) {
      emit(LoginErrorState(error: e.toString()));
    }*/
  }

  void getUser() async {
    try {
      LocalUser localUser = LocalUser();
      DatabaseUser databaseUser = DatabaseUser();
      UserModel authLocalUser = await localUser.getLocalUser();
      UserModel? authDatabaseUser =
          await databaseUser.readDbUser(authLocalUser.name);

      if (authDatabaseUser != null) {
        //emit(AuthAuthenticatedState());
      } else {
        //emit(AuthUnuauthenticatedState());
      }
    } catch (e) {
      //emit(AuthErrorState());
    }
  }
}
