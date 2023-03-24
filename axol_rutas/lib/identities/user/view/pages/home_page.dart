import 'package:axol_rutas/identities/user/cubit/login/controllers/login_txt_cubit.dart';
import 'package:axol_rutas/identities/user/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final UserModel user;

  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          print(context.read<UserTxtCubit>().state);
        },
        child: Text(user.rol));
  }
}
