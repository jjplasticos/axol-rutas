// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:axol_rutas/identities/product/model/product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../settings/format.dart';
import '../../product/repository/product_repo.dart';
import '../../shoppingcart/model/shoppingcart_models.dart';
import '../model/sale.dart';

abstract class SalesRepo {
  //--Base de datos
  //Tabla
  final String TABLE = 'sales';
  //Columnas
  final String UUID = 'id';
  final String LOCATION = 'location';
  final String PRODUCTS = 'product_list';
  final String CLIENT = 'client_name';
  final String TIME = 'time';
  final String TOTAL_QUANTITY = 'total_quantity';
  final String TOTAL_WEIGHT = 'total_weight';
  final String TOTAL_PRICE = 'total_price';
  final String VENDOR = 'vendor';
  //----
  //--Datos locales
  final String USER = 'user_name';
  //----
}

class DatabaseSales extends SalesRepo {
  final supabase = Supabase.instance.client;

  Future<List<SaleModel>> readSalesList(String filter) async {
    SaleModel sale;
    Map<String, dynamic> element;
    List<SaleModel> newList = [];
    List<SaleModel> filterSales = [];
    final List<SaleModel> finalSales;
    final String userName;
    List salesList = [];
    Map<String, dynamic> productsDB;

    final pref = await SharedPreferences.getInstance();
    userName = pref.getString(USER)!;

    salesList = await supabase
        .from(TABLE)
        .select<List<Map<String, dynamic>>>()
        .eq(VENDOR, userName);

    if (salesList.isNotEmpty) {
      for (element in salesList) {
        //Extracción de lista de productos
        productsDB = jsonDecode(jsonEncode(element[PRODUCTS]));

        sale = SaleModel(
            uid: element[UUID].toString(),
            location: element[LOCATION].toString(),
            products: productsDB,
            client: element[CLIENT].toString(),
            time: element[TIME].toString(),
            totalQuantity: element[TOTAL_QUANTITY].toString(),
            totalWeight: element[TOTAL_WEIGHT].toString(),
            totalPrice: element[TOTAL_PRICE].toString());
        newList.add(sale);
      }
    }

    bool isContain = false;
    if (filter != '') {
      for (var item in newList) {
        isContain = false;
        item.products.forEach((key, value) {
          if (value.toString().toLowerCase().contains(filter.toLowerCase())) {
            isContain = true;
          }
        });
        if (item.client.toLowerCase().contains(filter.toLowerCase()) ||
            FormatDate.dmy(item.time.toString())
                .toLowerCase()
                .contains(filter.toLowerCase())) {
          isContain = true;
        }
        if (isContain) {
          filterSales.add(item);
        }
      }
      finalSales = filterSales;
    } else {
      finalSales = newList;
    }

    return finalSales;
  }

  Future<bool> checkExistSale(String id) async {
    final bool isExist;
    final List salesDB;

    salesDB = await supabase.from(TABLE).select().eq(UUID, id);
    if (salesDB.isNotEmpty) {
      isExist = true;
    } else {
      isExist = false;
    }

    return isExist;
  }

  Future<void> writeSale(SaleModel sale) async {
    final String userName;
    final pref = await SharedPreferences.getInstance();
    userName = pref.getString(USER)!;

    await supabase.from(TABLE).insert({
      UUID: sale.uid,
      CLIENT: sale.client,
      TIME: sale.time,
      LOCATION: sale.location,
      VENDOR: userName,
      TOTAL_PRICE: sale.totalPrice,
      TOTAL_QUANTITY: sale.totalQuantity,
      TOTAL_WEIGHT: sale.totalWeight,
      PRODUCTS: sale.products,
    });
  }

  Future<void> deleteSale(String id) async {
    await supabase.from(TABLE).delete().eq(UUID, id);
  }
}
