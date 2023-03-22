import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/user_repo.dart';
import 'login_form.dart';

class LoginPage2 extends StatefulWidget {
  //final UserRepo userRepo;

  //LoginPage({super.key, required this.userRepo}) : assert(userRepo != null);

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Login page'),
    );
  }

  /*late LoginBloc _loginBloc;
  late AuthBloc _authBloc;

  UserRepo get _userRepo => widget.userRepo;

  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _loginBloc = LoginBloc(
      userRepo: _userRepo,
      authBloc: _authBloc,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: LoginForm(
        authBloc: _authBloc,
        loginBloc: _loginBloc,
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }*/
}
