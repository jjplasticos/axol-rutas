import '../../model/user.dart';
import '../../repository/user_repo.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc {
  late final String _stringValue;
  late final AuthEvent _authEvent;
  late final AuthState _authState;

  set setAutEvent(AuthEvent event) {
    _authEvent = event;
  }

  set setStringValue(String string) {
    _stringValue = string;
  }

  AuthState get getAuthState{
    bloc(_authEvent);
    return _authState;
  }

  void bloc(AuthEvent authEvent) {
    
    if (_authEvent is AppStarted) {
      //Logica de AppStarted.
    }
    if (_authEvent is LoggedIn) {
      //Logica de LoggedIn
      UserRepo userRepo = UserRepo();
      UserModel? userModel = userRepo.getUser(_stringValue) as UserModel;
      if (userModel != null) {
        print('Correcto');
      } else {
        print('error');
      }
    }
    if (_authEvent is LoggedOut) {
      //Logica de LoggedOut
    }
  }
}
