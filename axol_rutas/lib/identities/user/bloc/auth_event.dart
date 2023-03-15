abstract class AuthEvent {
  const AuthEvent();
}

class AppStarted extends AuthEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthEvent {
  final String token;

  LoggedIn({required this.token});

  @override
  String toString() => 'LoggedIn $token';
}

class LoggedOut extends AuthEvent {
  @override
  String toString() => 'LoggedOut';
}

/*class CheckLogin extends AuthEvent {
  const CheckLogin({required this.userName, required this.password});

  final String userName;
  final String password;
}*/
