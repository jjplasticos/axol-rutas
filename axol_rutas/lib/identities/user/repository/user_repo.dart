// ignore_for_file: non_constant_identifier_names

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:axol_rutas/identities/user/model/user.dart';

class UserRepo {
  final supabase = Supabase.instance.client;
  final String TABLE = 'users';
  final String USER_COLUMN = 'user_name';
  final String ID_COLUMN = 'id';
  final String ROL_COLUMN = 'rol';
  final String PASSWORD_USER = 'password';

  Future<UserModel?> getUser(String userSearch) async {
    final UserModel? user;
    final userData = await supabase
        .from(TABLE)
        .select<List<Map<String, dynamic>>>('*')
        .eq(USER_COLUMN, userSearch);
    if (userData.isNotEmpty) {
      user = UserModel(
        name: userData.first[USER_COLUMN],
        uid: userData.first[ID_COLUMN],
        rol: userData.first[ROL_COLUMN],
        password: userData.first[PASSWORD_USER],
      );
    } else {
      user = null;
    }
    //String a = user!.name;

    return user;
  }
}
