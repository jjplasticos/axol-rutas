abstract class AuthState {
  const AuthState(this.userName, this.password);
  final String userName;
  final String password;
}

class LoginSuccessful extends AuthState {
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
}
