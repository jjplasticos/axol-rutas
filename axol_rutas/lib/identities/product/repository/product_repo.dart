// ignore_for_file: non_constant_identifier_names
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/product.dart';

abstract class ProductRepo {
  final String TABLE = 'products';
  final String CODE = 'code';
  final String PRODUCT = 'attributes';
}

class DatabaseProducts extends ProductRepo {
  //Constantes de JSON del producto en la base de datos;
  final String JSON_CODE = 'code';
  final String JSON_TYPE = 'type';
  final String JSON_GAUGE = 'gauge';
  final String JSON_PIECES = 'pices';
  final String JSON_WEIGHT = 'weight';
  final String JSON_MASURE = 'measure';
  final String JSON_PACKING = 'packing';
  final String JSON_CAPACITY = 'capacity';
  final String JSON_DESCRIPTION = 'description';

  final supabase = Supabase.instance.client;

  Future<List<Map>> readProductList(List<String> codeList) async {
    Map<String, dynamic> element;
    List<Map> newList = [];
    List productList = [];

    productList = await supabase.from(TABLE).select().in_(CODE, codeList);

    if (productList.isNotEmpty) {
      for (element in productList) {
        newList.add(element[PRODUCT]);
      }
    }

    return newList;
  }

  Future<ProductModel?> readProduct(String code) async {
    ProductModel? product;
    Map<String, dynamic> element;
    List productList = [];

    productList = await supabase.from(TABLE).select().eq(CODE, code);
    if (productList.isNotEmpty) {
      element = productList.first[PRODUCT];
      product = ProductModel(
          capacity: element[JSON_CAPACITY].toString(),
          code: element[JSON_CODE].toString(),
          description: element[JSON_DESCRIPTION].toString(),
          gauge: element[JSON_GAUGE].toString(),
          measure: element[JSON_MASURE].toString(),
          packing: element[JSON_PACKING].toString(),
          pices: element[JSON_PIECES].toString(),
          type: element[JSON_TYPE].toString(),
          weight: element[JSON_WEIGHT].toString(),
          filetValues: '');
    }

    return product;
  }
}
