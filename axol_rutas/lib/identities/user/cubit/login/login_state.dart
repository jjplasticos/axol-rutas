// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitialState extends LoginState {
  @override
  String toString() => 'LoginInitialState';

  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  @override
  String toString() => 'LoginSuccessState';

  @override
  List<Object?> get props => [];
}

class LoginFailureState extends LoginState {
  @override
  String toString() => 'LoginFailure';

  @override
  List<Object?> get props => [];
}

class LoginErrorState extends LoginState {
  String error;

  LoginErrorState({required this.error});

  @override
  String toString() => 'Error: $error';

  @override
  List<Object?> get props => [error];
}
