import 'auth/auth_event.dart';
import 'auth/auth_state.dart';
import 'auth/auth_bloc.dart';

class UserProvider {
  AuthState authBloc(AuthEvent authEvent) {
    AuthBloc thisAuthBloc = AuthBloc();
    thisAuthBloc.setAutEvent = authEvent;
    return thisAuthBloc.getAuthState;
  }
}
