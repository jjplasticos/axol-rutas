import 'package:equatable/equatable.dart';

import '../../model/user.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthUnitializedState extends AuthState {
  @override
  String toString() => 'AuthState';

  @override
  List<Object?> get props => [];
}

class AuthAuthenticatedState extends AuthState {
  //final UserModel user;

  //const AuthAuthenticatedState(this.user);

  @override
  String toString() => 'AuthAuthenticated';

  @override
  List<Object?> get props => [];
}

class AuthUnuauthenticatedState extends AuthState {
  @override
  String toString() => 'AuthUnuauthenticated';

  @override
  List<Object?> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  String toString() => 'AuthLoading';

  @override
  List<Object?> get props => [];
}

class AuthErrorState extends AuthState {
  @override
  String toString() => 'AuthErrorState';

  @override
  List<Object?> get props => [];
}
