import 'package:axol_rutas/identities/user/model/user.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialState extends LoginState {
  @override
  String toString() => 'LoginInitialState';

  @override
  List<Object?> get props => [];
}

class LoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends LoginState {
  @override
  List<Object?> get props => [];
}

class SuccessState extends LoginState {
  final UserModel user;

  const SuccessState({required this.user});

  @override
  String toString() => 'LoginSuccessState';

  @override
  List<Object?> get props => [user];
}

class FailureState extends LoginState {
  @override
  String toString() => 'LoginFailure';

  @override
  List<Object?> get props => [];
}

class ErrorState extends LoginState {
  final String error;

  const ErrorState({required this.error});

  @override
  String toString() => 'Error: $error';

  @override
  List<Object?> get props => [error];
}

class TestState extends LoginState {
  final int testNumber;
  final String testText;
  const TestState({required this.testNumber, required this.testText});
  @override
  List<Object?> get props => [testNumber, testText];
}
