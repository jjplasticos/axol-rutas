import 'package:axol_rutas/identities/user/bloc/login/login_event.dart';
import 'package:axol_rutas/identities/user/bloc/login/login_state.dart';

import '../../repository/user_repo.dart';

class LoginBloc {
  late final UserRepo _userRepo;
  late final LoginEvent _loginEvent;
  late final LoginState _loginState;

  set setUserRepo(UserRepo user) {
    _userRepo = user;
  }

  set setLoginEvent(LoginEvent event) {
    _loginEvent = event;
  }

  LoginState get getLoginState {
    bloc(_loginEvent);
    return _loginState;
  }

  void bloc(LoginEvent loginEvent) {
    if (loginEvent is LoginButtonPressed) {
      //Loginca de LoginButtonPressed
      loginEvent.userName;
    }
  }
}
