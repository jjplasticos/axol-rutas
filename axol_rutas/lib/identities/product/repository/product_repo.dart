// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/product.dart';

abstract class ProductRepo {
  final String TABLE = 'products';
  final String CODE = 'code';
  final String PRODUCT = 'attributes';
}

class DatabaseProducts extends ProductRepo {
  final supabase = Supabase.instance.client;

  Future<List<Map>> readProductList(List<String> codeList) async {
    ProductModel product;
    Map<String, dynamic> element;
    List<Map> newList = [];
    List productList = [];

    productList = await supabase.from(TABLE).select().in_(CODE, codeList);

    if (productList.isNotEmpty) {
      for (element in productList) {
        newList.add(element[PRODUCT]);
        print(element[PRODUCT].toString());

        /*sale = SaleModel(
            uid: element[UID].toString(),
            location: element[LOCATION].toString(),
            products: element[PRODUCTS].toString(),
            client: element[CLIENT].toString(),
            time: element[TIME].toString(),
            totalQuantity: element[TOTAL_QUANTITY].toString(),
            totalWeight: element[TOTAL_WEIGHT].toString(),
            totalPrice: element[TOTAL_PRICE].toString());
        newList.add(sale);*/
      }
    } else {
      //print('empty....');
    }

    return newList;
  }
}
