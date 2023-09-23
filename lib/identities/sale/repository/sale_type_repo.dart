import 'package:supabase_flutter/supabase_flutter.dart';

import '../../user/model/user.dart';
import '../model/sale_type_model.dart';

class SaleTypeRepo {
  //Tabla
  final String _table = 'sale_type';
  //Columnas
  final String _id = 'id';
  final String _type = 'type';
  final String _userList = 'user_list';
  //Base de datos
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<SaleTypeModel>> fetchSaleTypeList(UserModel user) async {
    List<Map<String, dynamic>> saleTypeDB = [];
    List<SaleTypeModel> saleTypeList = [];
    SaleTypeModel saleType;

    saleTypeDB = await _supabase
        .from(_table)
        .select<List<Map<String, dynamic>>>()
        .like(_userList, '%/${user.id}/%');

    if (saleTypeDB.isNotEmpty) {
      for (var element in saleTypeDB) {
        saleType = SaleTypeModel(
            id: element[_id],
            type: element[_type],
            userList: element[_userList]);
        saleTypeList.add(saleType);
      }
    }

    return saleTypeList;
  }
}
