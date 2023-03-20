// ignore_for_file: unnecessary_null_comparison

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/user.dart';
import '../../repository/user_repo.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthEvent _authEvent = AppStarted();
  AuthState _authState = AuthUnitialized();

  AuthBloc(super.initialState);

  set setAutEvent(AuthEvent event) {
    _authEvent = event;
  }

  AuthState get getAuthState {
    _authState = bloc(_authEvent) as AuthState;
    print(_authState.toString());
    return _authState;
  }

  Future<AuthState> bloc(AuthEvent event) async {
    AuthState state = AuthUnitialized();
    if (event is AppStarted) {
      //Logica de AppStarted.
      state = AuthLoading();
    }
    if (event is LoggedIn) {
      //Logica de LoggedIn
      LocalUser localUser = LocalUser();
      DatabaseUser databaseUser = DatabaseUser();
      UserModel authLocalUser = await localUser.getLocalUser();
      UserModel? authDatabaseUser =
          await databaseUser.readDbUser(authLocalUser.name);

      if (authDatabaseUser != null) {
        state = AuthAuthenticated();
        localUser.setLocalUser(authLocalUser.name, authLocalUser.rol);
      } else {
        state = AuthUnuauthenticated();
      }
      //print(_authState.toString());
    }
    if (event is LoggedOut) {
      //Logica de LoggedOut
    }

    return state;
  }
}
