// ignore_for_file: non_constant_identifier_names

import 'package:axol_rutas/identities/product/model/product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../shoppingcart/model/shoppingcart_models.dart';

abstract class InventoryRepo {
  final String TABLE = 'inventory';
  final String STOCK = 'stock';
  final String MANAGER = 'retail_manager';
  final String USER = 'user_name';
  final String CODE = 'code';
  final String NAME = 'name';
  final String SHOPPINGCART = 'shoppingcart';
  final String DESCRIPTION = 'description';
  final String WEIGHT = 'weight';
  final String PRICE = 'price';
  final String QUANTITY = 'quantity';
  final supabase = Supabase.instance.client;
}

class FetchInventory extends InventoryRepo {
  Future<Map<String, String>> readInventoryProducts() async {
    Map<String, String> productsMap = {};
    Map<String, dynamic> element;
    final List inventoryList = await readInventory();

    if (inventoryList.isNotEmpty) {
      for (element in inventoryList) {
        productsMap[element[CODE].toString()] = element[STOCK].toString();
      }
    } else {}
    return productsMap;
  }

  Future<Map<String, dynamic>> readInventoryDetails() async {
    Map<String, dynamic> inventoryDetails;
    final List inventoryList = await readInventory();

    if (inventoryList.isNotEmpty) {
      inventoryDetails = {
        NAME: inventoryList.first[NAME],
        MANAGER: inventoryList.first[MANAGER],
      };
    } else {
      inventoryDetails = {};
    }
    return inventoryDetails;
  }

  Future<List<String>> readInventoryCodes() async {
    List<String> codes = [];
    Map<String, dynamic> element;
    final List inventoryList = await readInventory();

    if (inventoryList.isNotEmpty) {
      for (element in inventoryList) {
        codes.add(element[CODE].toString());
      }
    }
    return codes;
  }

  Future<List> readInventory() async {
    List<Map<String, dynamic>> productsList = [];
    final String userName;
    List inventoryList = [];

    final pref = await SharedPreferences.getInstance();
    userName = pref.getString(USER)!;
    inventoryList = await supabase
        .from(TABLE)
        .select<List<Map<String, dynamic>>>()
        .eq(NAME, userName);
    return inventoryList;
  }

  Future<String> getStock(ProductModel product) async {
    final String userName;
    final String stock;
    final List list;
    final pref = await SharedPreferences.getInstance();

    userName = pref.getString(USER)!;
    list = await supabase
        .from(TABLE)
        .select(STOCK)
        .eq(NAME, userName)
        .eq(CODE, product.code);
    stock = list.first[STOCK].toString();

    return stock;
  }

  Future<bool> checkAllStock(List<ShoppingcartItemModel> shoppingcart) async {
    Map<String, double> shppcRedux = {};
    Map<String, dynamic> inventoryMapDB = {};
    List<String> codesDB = [], codesRedux = [];
    bool isExist = true;
    String stockString;
    double stock;

    //Factoriza shoppingcart para no repetir las claves.
    for (var element in shoppingcart) {
      if (shppcRedux.containsKey(element.product.code)) {
        shppcRedux[element.product.code] =
            shppcRedux[element.product.code]! + element.quantity;
      } else {
        shppcRedux[element.product.code] = element.quantity;
      }
    }

    //Obtiente todo el inventario del usuario desde la base de datos.
    final List inventoryListDB = await readInventory();

    //Organiza en una lista las claves de inventoryListDB, si su stock es menor
    //a cero, no los agrega a la lista.
    for (var element in inventoryListDB) {
      if (element[STOCK] > 0) {
        codesDB.add(element[CODE].toString());
      }
      inventoryMapDB[element[CODE]] = element[STOCK];
    }
    //Enlista las claves de shppcRedux.
    shppcRedux.forEach((key, value) {
      codesRedux.add(key);
    });

    //Compara las claves de las listas, si codesDB no contiene una de codesREdux,
    //retorna false.
    for (int i = 0; isExist == true && i < codesRedux.length; i++) {
      if (codesDB.contains(codesRedux.elementAt(i))) {
        stockString = inventoryMapDB[codesRedux.elementAt(i)].toString();
        stock = double.parse(stockString);
        if (stock >= shppcRedux[codesRedux.elementAt(i)]!) {
          isExist == true;
        } else {
          isExist = false;
        }
      } else {
        isExist = false;
      }
    }

    return (isExist);
  }
}

class UpdateInventory extends InventoryRepo {
  void updateStock(double newStock, String code) async {
    final pref = await SharedPreferences.getInstance();
    final String userName = pref.getString(USER)!;
    await supabase
        .from(TABLE)
        .update({STOCK: newStock})
        .eq(NAME, userName)
        .eq(CODE, code);
  }
}
