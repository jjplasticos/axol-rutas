// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:axol_rutas/identities/product/model/product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  Future<List<SaleModel>> readSalesList() async {
    SaleModel sale;
    Map<String, dynamic> element;
    List<SaleModel> newList = [];
    final String userName;
    List salesList = [];
    Map<String, dynamic> productsDB;
    List<ShoppingcartItemModel> productsSale;
    ShoppingcartItemModel shoppingcartItem;
    ProductModel? product;
    String quantity;
    String price;

    final pref = await SharedPreferences.getInstance();
    userName = pref.getString(USER)!;

    salesList = await supabase
        .from(TABLE)
        .select<List<Map<String, dynamic>>>()
        .eq(VENDOR, userName);

    if (salesList.isNotEmpty) {
      productsSale = [];
      for (element in salesList) {
        //-----Extracción de lista de productos
        productsDB = jsonDecode(jsonEncode(element[PRODUCTS]));
        /*productsDB.forEach((key, value) async {
          product = await DatabaseProducts().readProduct(key);
          quantity = value.split('//').first;
          price = value.split('//').last;
          shoppingcartItem = ShoppingcartItemModel(
              product: product!,
              quantity: double.parse(quantity),
              price: double.parse(price));
          productsSale.add(shoppingcartItem);
        });*/
        //----------

        sale = SaleModel(
            uid: element[UUID].toString().split('-').first,
            location: element[LOCATION].toString(),
            products: productsDB,
            client: element[CLIENT].toString(),
            time: element[TIME].toString(),
            totalQuantity: element[TOTAL_QUANTITY].toString(),
            totalWeight: element[TOTAL_WEIGHT].toString(),
            totalPrice: element[TOTAL_PRICE].toString());
        newList.add(sale);
      }
    } else {
      //print('empty....');
    }

    return newList;
  }

  void writeSale(SaleModel sale) async {
    final String userName;
    final pref = await SharedPreferences.getInstance();
    userName = pref.getString(USER)!;
    //Map<String, String> products = {};

    /*for (var element in sale.products) {
      products[element.product.code] = '${element.quantity}//${element.price}';
    }*/

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
}
