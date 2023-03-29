// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/sale.dart';

abstract class SalesRepo {
  final String TABLE = 'sales';
  final String UID = 'id';
  final String LOCATION = 'location';
  final String PRODUCTS = 'product_list';
  final String CLIENT = 'client_name';
  final String TIME = 'time';
  final String TOTAL_QUANTITY = 'total_quantity';
  final String TOTAL_WEIGHT = 'total_weight';
  final String TOTAL_PRICE = 'total_price';
  final String VENDOR = 'vendor';
  final String USER = 'user_name';
}

class DatabaseSales extends SalesRepo {
  final supabase = Supabase.instance.client;

  Future<List<SaleModel>> readSalesList() async {
    SaleModel sale;
    Map<String, dynamic> element;
    List<SaleModel> newList = [];
    final String userName;

    final pref = await SharedPreferences.getInstance();
    userName = pref.getString(USER)!;

    final salesList = await supabase
        .from(TABLE)
        .select<List<Map<String, dynamic>>>('*')
        .eq(VENDOR, userName);

    if (salesList.isNotEmpty) {
      for (element in salesList) {
        sale = SaleModel(
            uid: element[UID],
            location: element[LOCATION],
            products: element[PRODUCTS],
            client: element[CLIENT],
            time: element[TIME],
            totalQuantity: element[TOTAL_QUANTITY],
            totalWeight: element[TOTAL_WEIGHT],
            totalPrice: element[TOTAL_PRICE]);
        newList.add(sale);
      }
    }

    return newList;
  }
}
