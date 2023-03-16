import 'auth_event.dart';
import 'auth_state.dart';
import 'auth_bloc.dart';

class UserProvider {
  AuthState authBloc(AuthEvent authEvent) {
    AuthBloc thisAuthBloc = AuthBloc();
    thisAuthBloc.setAutEvent = authEvent;
    return thisAuthBloc.getAuthState;
  }
}
