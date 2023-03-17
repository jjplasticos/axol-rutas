abstract class AuthState {
  const AuthState();
}

//class AuthUnitialized extends AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthUnuauthenticated extends AuthState {}

class AuthLoading extends AuthState {}
