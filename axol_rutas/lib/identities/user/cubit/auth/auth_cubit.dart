// ignore_for_file: unnecessary_null_comparison

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/user.dart';
import '../../repository/user_repo.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthLoadingState()) {
    getUser();
  }

  void getUser() async {
    try {
      LocalUser localUser = LocalUser();
      DatabaseUser databaseUser = DatabaseUser();
      UserModel authLocalUser = await localUser.getLocalUser();
      UserModel? authDatabaseUser =
          await databaseUser.readDbUser(authLocalUser.name);

      if (authDatabaseUser != null) {
        emit(AuthAuthenticatedState());
      } else {
        emit(AuthUnuauthenticatedState());
      }
    } catch (e) {
      emit(AuthErrorState());
    }
  }
}
