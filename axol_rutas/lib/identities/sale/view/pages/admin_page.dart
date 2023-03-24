import 'package:axol_rutas/identities/user/model/user.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  final UserModel user;

  const AdminPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return const Text('Admin page');
  }
}
