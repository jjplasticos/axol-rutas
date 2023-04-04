import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/product.dart';

abstract class ProductRepo {
  final String TABLE = 'sales';
  final String UID = 'sale_id';
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

class DatabaseSales extends ProductRepo {
  final supabase = Supabase.instance.client;

  Future<List<ProductModel>> readProductList() async {
    ProductModel product;
    Map<String, dynamic> element;
    List<ProductModel> newList = [];
    final String userName;
    List productList = [];

    final pref = await SharedPreferences.getInstance();
    userName = pref.getString(USER)!;

    /*salesList = await supabase
        .from(TABLE)
        .select<List<Map<String, dynamic>>>()
        .eq(VENDOR, userName);

    if (salesList.isNotEmpty) {
      for (element in salesList) {
        sale = SaleModel(
            uid: element[UID].toString(),
            location: element[LOCATION].toString(),
            products: element[PRODUCTS].toString(),
            client: element[CLIENT].toString(),
            time: element[TIME].toString(),
            totalQuantity: element[TOTAL_QUANTITY].toString(),
            totalWeight: element[TOTAL_WEIGHT].toString(),
            totalPrice: element[TOTAL_PRICE].toString());
        newList.add(sale);
      }
    } else {
      //print('empty....');
    }*/

    return newList;
  }
}
