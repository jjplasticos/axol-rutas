import 'dart:async';

import 'package:axol_rutas/identities/user/bloc/auth_event.dart';
import 'package:axol_rutas/identities/user/bloc/auth_state.dart';
import 'package:axol_rutas/identities/user/repository/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepo userRepo;

  AuthBloc(super.initialState, {required this.userRepo})
      : assert(userRepo != null);

  @override
  AuthState get initialState => AuthUnitialized();

  @override
  Stream<AuthState> mapEventToState(
    AuthState currentState,
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepo.hasToken();

      if (hasToken) {
        yield AuthAuthenticated();
      } else {
        yield AuthUnuauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthLoading();
      await userRepo.persistToken(event.token);
      yield AuthUnuauthenticated();
    }
  }
}
