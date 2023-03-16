abstract class LoginEvent {
  LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String userName;
  final String password;

  LoginButtonPressed({
    required this.userName,
    required this.password,
  });

  //@override
  String get getUserName => userName;

  @override
  String toString() =>
      'LoginButtonPressed {userName: $userName, password: $password}';
}
