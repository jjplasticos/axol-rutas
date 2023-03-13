abstract class AuthEvent {
  const AuthEvent();
}

class CheckLogin extends AuthEvent {
  const CheckLogin({required this.userName, required this.password});

  final String userName;
  final String password;
}
