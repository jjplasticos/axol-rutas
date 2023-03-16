import 'package:axol_rutas/identities/user/bloc/auth_event.dart';
import 'package:axol_rutas/identities/user/bloc/auth_state.dart';

import '../repository/auth_repo.dart';

class AuthBloc {
  late final UserRepo _userRepo;
  late final AuthEvent _authEvent;
  late final AuthState _authState;

  set setUserRepo(UserRepo user) {
    _userRepo = user;
  }

  set setAutEvent(AuthEvent event) {
    _authEvent = event;
  }

  AuthState get getAuthState {
    bloc();
    return _authState;
  }

  void bloc() {
    if (_authEvent is AppStarted) {
      //Logica de AppStarted.
    }
    if (_authEvent is LoggedIn) {
      //Logica de LoggedIn
    }
    if (_authEvent is LoggedOut) {
      //Logica de LoggedOut
    }
  }
}
