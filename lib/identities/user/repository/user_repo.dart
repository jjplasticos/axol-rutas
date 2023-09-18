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
  final String _vendorName = 'vendor_name';
  final String _vendorId = 'vendor_id';
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

  Future<List<UserModel>> fetchVendors() async {
    List<UserModel> users = [];
    UserModel user;
    List<Map<String, dynamic>> usersDB = [];
    usersDB = await supabase
        .from(TABLE)
        .select<List<Map<String, dynamic>>>()
        .eq(ROL, 'vendor');
    if (usersDB.isNotEmpty) {
      for (var element in usersDB) {
        user = UserModel(
          name: element[USER], 
          id: element[ID], 
          rol: element[ROL], 
          password: element[PASSWORD]);
        users.add(user);
      }
    }
    return users;
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
      user =
          UserModel(name: localUser, id: localId, rol: localRol, password: '');
    } else {
      user = UserModel(name: '', id: -1, rol: '', password: '');
    }
    return user;
  }

  Future<void> setLocalUser(
      String newLocalUser, String newLocalRol, int newLocalId) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(USER, newLocalUser);
    await pref.setString(ROL, newLocalRol);
    await pref.setInt(ID, newLocalId);
  }

  Future<void> removeLocalUser() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(USER);
    await pref.remove(ROL);
    await pref.remove(ID);
  }

  Future<UserModel> getLocalVendor() async {
    final UserModel user;
    final pref = await SharedPreferences.getInstance();
    final String? localUser = pref.getString(_vendorName);
    final int? localId = pref.getInt(_vendorId);
    if (localUser != null&& localId != null) {
      user =
          UserModel(name: localUser, id: localId, rol: 'vendor', password: '');
    } else {
      user = UserModel(name: '', id: -1, rol: '', password: '');
    }
    return user;
  }

  Future<void> setLocalVendor(
      String newLocalVendor, int newLocalId) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_vendorName, newLocalVendor);
    await pref.setInt(_vendorId, newLocalId);
  }

  Future<void> removeLocalVendor() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(_vendorName);
    await pref.remove(_vendorId);
  }
}
