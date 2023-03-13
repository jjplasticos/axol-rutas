import 'dart:async';

import 'package:axol_rutas/identities/user/bloc/auth_event.dart';
import 'package:axol_rutas/identities/user/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:axol_rutas/identities/user/repository/data.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Data _data;
  static const String _password = '';
  static const String _userName = '';

  //StreamSubscription<Data> _dataSubscription;

  AuthBloc({required Data data})
      : _data = data,
        super(LoginInitial(_userName, _password)) {
    //TODO: implement event handlers
  }

  /*@override
  Future<void> close() {
    _dataSubscription.cancel();
    return super.close();
  }*/

  void _onClick(CheckLogin event, Emitter<AuthState> emit) {
    if (_data.data() == 'si') {
      emit(LoginSuccessful('userName', 'password'));
    } else {
      emit(LoginFailed('userName', 'password'));
    }
  }
}
