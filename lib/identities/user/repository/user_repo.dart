// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:axol_rutas/identities/user/model/user.dart';

abstract class UserRepo {
  final String TABLE = 'users';
  final String USER = 'user_name';
  final String ID = 'id';
  final String ROL = 'rol';
  final String PASSWORD = 'password';
}

class DatabaseUser extends UserRepo {
  final supabase = Supabase.instance.client;

  Future<UserModel?> readDbUser(String userSearch) async {
    final UserModel? user;
    final userData = await supabase
        .from(TABLE)
        .select<List<Map<String, dynamic>>>('*')
        .eq(USER, userSearch);
    if (userData.isNotEmpty) {
      user = UserModel(
        name: userData.first[USER],
        id: userData.first[ID],
        rol: userData.first[ROL],
        password: userData.first[PASSWORD],
      );
    } else {
      user = null;
    }
    return user;
  }
}

class LocalUser extends UserRepo {
  Future<UserModel> getLocalUser() async {
    final UserModel user;
    final pref = await SharedPreferences.getInstance();
    final String? localUser = pref.getString(USER);
    final String? localRol = pref.getString(ROL);
    final int? localId = pref.getInt(ID);
    if (localUser != null && localRol != null && localId != null) {
      user = UserModel(name: localUser, id: localId, rol: localRol, password: '');
    } else {
      user = UserModel(name: '', id: -1, rol: '', password: '');
    }
    return user;
  }

  Future<void> setLocalUser(String newLocalUser, String newLocalRol, int newLocalId) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(USER, newLocalUser);
    await pref.setString(ROL, newLocalRol);
    await pref.setInt(ID, newLocalId);
  }

  Future<void> removeLocalUser() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(USER);
    await pref.remove(ROL);
  }
}
