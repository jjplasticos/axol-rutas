import 'package:axol_rutas/identities/user/bloc/auth_bloc.dart';
import 'package:axol_rutas/identities/user/bloc/auth_event.dart';
import 'package:axol_rutas/identities/user/bloc/login_event.dart';
import 'package:axol_rutas/identities/user/bloc/login_state.dart';
import 'package:axol_rutas/identities/user/repository/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/auth_repo.dart';

/*class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepo userRepo;
  final AuthBloc authBloc;

  LoginBloc(super.initialState,
      {required this.userRepo, required this.authBloc})
      : assert(userRepo != null),
        assert(authBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginState currentState,
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepo.auth(
          userName: event.userName,
          password: event.password,
        );
        authBloc.add(LoggedIn(token: token));
        //authBloc.dispatch(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}*/

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
    bloc();
    return _loginState;
  }

  void bloc() {
    if (_loginEvent is LoginButtonPressed) {
      //Loginca de LoginButtonPressed
      _loginEvent.runtimeType;
    }
  }
}
