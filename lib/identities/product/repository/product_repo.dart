// ignore_for_file: non_constant_identifier_names
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/product.dart';

abstract class ProductRepo {
  final String TABLE = 'products';
  final String CODE = 'code';
  final String PRODUCT = 'attributes';
  final String CLASS = 'class';
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
        element[PRODUCT][CLASS] = element[CLASS];
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
          pieces: element[JSON_PIECES].toString(),
          type: element[JSON_TYPE].toString(),
          weight: element[JSON_WEIGHT].toString(),
          class_: productList.first[CLASS],
          filetValues: '');
    }
    return product;
  }

  Future<List<ProductModel>> getProductList(List<String> codes) async {
    ProductModel product;
    List<ProductModel> productList = [];
    List<Map<String, dynamic>> productsDB = [];

    productsDB = await supabase
        .from(TABLE)
        .select<List<Map<String, dynamic>>>()
        .in_(CODE, codes);
    if (productsDB.isNotEmpty) {
      for (var element in productsDB ) {
        product = ProductModel(
          capacity: element[PRODUCT][JSON_CAPACITY], 
          code: element[CODE], 
          description: element[PRODUCT][JSON_DESCRIPTION], 
          gauge: element[PRODUCT][JSON_GAUGE], 
          measure: element[PRODUCT][JSON_MASURE], 
          packing: element[PRODUCT][JSON_PACKING], 
          pieces: element[PRODUCT][JSON_PIECES], 
          type: element[PRODUCT][JSON_TYPE], 
          weight: element[PRODUCT][JSON_WEIGHT], 
          class_: element[CLASS],
          filetValues: '');
        productList.add(product);
      }
    }
    return productList;
  }
}
