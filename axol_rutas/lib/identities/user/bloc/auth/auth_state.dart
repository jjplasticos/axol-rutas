abstract class AuthState {
  const AuthState();
}

class AuthUnitialized extends AuthState {
  @override
  String toString() => 'AuthState';
}

class AuthAuthenticated extends AuthState {
  @override
  String toString() => 'AuthAuthenticated';
}

class AuthUnuauthenticated extends AuthState {
  @override
  String toString() => 'AuthUnuauthenticated';
}

class AuthLoading extends AuthState {
  @override
  String toString() => 'AuthLoading';
}
