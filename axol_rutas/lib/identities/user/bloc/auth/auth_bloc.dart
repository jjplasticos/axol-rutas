// ignore_for_file: unnecessary_null_comparison

import '../../model/user.dart';
import '../../repository/user_repo.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc {
  late final AuthEvent _authEvent;
  late final AuthState _authState;

  set setAutEvent(AuthEvent event) {
    _authEvent = event;
  }

  AuthState get getAuthState {
    bloc(_authEvent);
    return _authState;
  }

  void bloc(AuthEvent event) {
    if (event is AppStarted) {
      //Logica de AppStarted.
      _authState = AuthLoading();
    }
    if (event is LoggedIn) {
      //Logica de LoggedIn
      LocalUser localUser = LocalUser();
      DatabaseUser databaseUser = DatabaseUser();
      UserModel authLocalUser = localUser.getLocalUser() as UserModel;
      UserModel? authDatabaseUser =
          databaseUser.readDbUser(authLocalUser.name) as UserModel;

      if (authDatabaseUser != null) {
        _authState = AuthAuthenticated();
        localUser.setLocalUser(authLocalUser.name, authLocalUser.rol);
      } else {
        _authState = AuthUnuauthenticated();
      }
    }
    if (event is LoggedOut) {
      //Logica de LoggedOut
    }
  }
}
