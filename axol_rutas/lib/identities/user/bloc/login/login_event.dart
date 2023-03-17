import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String userName;
  final String password;

  const LoginButtonPressed(
    this.userName,
    this.password,
  );
  
  @override
  String toString() =>
      'LoginButtonPressed {userName: $userName, password: $password}';

  @override
  List<Object?> get props => [userName, password];
}
