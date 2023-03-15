abstract class LoginEvent {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String userName;
  final String password;

  const LoginButtonPressed({
    required this.userName,
    required this.password,
  });

  @override
  String toString() =>
      'LoginButtonPressed {userName: $userName, password: $password}';
}
