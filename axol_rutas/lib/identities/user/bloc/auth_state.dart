abstract class AuthState {
  const AuthState();
}

class AuthUnitialized extends AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthUnuauthenticated extends AuthState {}

class AuthLoading extends AuthState {}

/*class LoginSuccessful extends AuthState {
  const LoginSuccessful(super.userName, super.password);
  @override
  String toString() => 'Login successgul';
}

class LoginFailed extends AuthState {
  LoginFailed(super.userName, super.password);
  @override
  String toString() => 'Login failed';
}

class LoginInitial extends AuthState {
  LoginInitial(super.userName, super.password);
  @override
  String toString() => 'Initial login';
}*/
