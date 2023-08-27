import 'dart:convert';

import 'package:axol_rutas/identities/product/model/product.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../settings/format.dart';
import '../../product/repository/product_repo.dart';
import '../../shoppingcart/model/shoppingcart_models.dart';
import '../model/sale_model.dart';
import '../model/srep_form_model.dart';

abstract class SalesRepo {
  //--Base de datos
  //Tabla
  final String _table = 'sales';
  //Columnas
  final String _id = 'id';
  final String _locaction = 'location';
  final String _product = 'product_list';
  final String _client = 'client_name';
  final String _time = 'time';
  final String _totalQuantity = 'total_quantity';
  final String _totalWeight = 'total_weight';
  final String _totalPrice = 'total_price';
  final String _vendor = 'vendor';
  //----
  //--Datos locales
  final String _user = 'user_name';
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
    userName = pref.getString(_user)!;

    salesList = await supabase
        .from(_table)
        .select<List<Map<String, dynamic>>>()
        .eq(_vendor, userName);

    if (salesList.isNotEmpty) {
      for (element in salesList) {
        //Extracción de lista de productos
        productsDB = jsonDecode(jsonEncode(element[_product]));

        sale = SaleModel(
            uid: element[_id].toString(),
            location: element[_locaction].toString(),
            itemsShppc: productsDB,
            client: element[_client].toString(),
            time: element[_time].toString(),
            totalQuantity: element[_totalQuantity].toString(),
            totalWeight: element[_totalWeight].toString(),
            totalPrice: element[_totalPrice].toString());
        newList.add(sale);
      }
    }
    bool isContain = false;
    DateTime time;
    String timeText;
    if (filter != '') {
      for (var item in newList) {
        time = DateTime.fromMillisecondsSinceEpoch(int.parse(item.time));
        timeText = '${time.day}/${time.month}/${time.year}';
        isContain = false;
        item.itemsShppc.forEach((key, value) {
          if (value.toString().toLowerCase().contains(filter.toLowerCase())) {
            isContain = true;
          }
        });
        if (item.client.toLowerCase().contains(filter.toLowerCase()) ||
            timeText.contains(filter.toLowerCase())) {
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

  Future<List<SaleModel>> readListReport(SRepFormModel form) async {
    SaleModel sale;
    Map<String, dynamic> element;
    List<SaleModel> saleList = [];
    final String userName;
    List<Map<String, dynamic>> salesDB = [];
    Map<String, dynamic> productsDB;
    final String finder = form.finder.text;
    int startTime = 0;
    int endTime = 32503708800000;
    DateTime startDate;
    DateTime endDate;

    final pref = await SharedPreferences.getInstance();
    userName = pref.getString(_user)!;

    if (form.isTime) {
      startDate = DateTime(form.time.year, form.time.month, form.time.day);
      endDate = DateTime(form.time.year, form.time.month, form.time.day + 1);
      startTime = startDate.millisecondsSinceEpoch;
      endTime = endDate.millisecond;
    }
    if (finder == '') {
      salesDB = await supabase
          .from(_table)
          .select<List<Map<String, dynamic>>>()
          .eq(_vendor, userName)
          .lte(_time, startTime)
          .gte(_time, endTime)
          .order(_time, ascending: true);
    } else {
      salesDB = await supabase
          .from(_table)
          .select<List<Map<String, dynamic>>>()
          .eq(_vendor, userName)
          .ilike(_client, '%$finder%')
          .ilike(_product, '%$finder%')
          .lte(_time, startTime)
          .gte(_time, endTime)
          .order(_time, ascending: true);
    }

    if (salesDB.isNotEmpty) {
      for (element in salesDB) {
        //Extracción de lista de productos
        productsDB = jsonDecode(jsonEncode(element[_product]));
        sale = SaleModel(
            uid: element[_id].toString(),
            location: element[_locaction].toString(),
            itemsShppc: productsDB,
            client: element[_client].toString(),
            time: element[_time].toString(),
            totalQuantity: element[_totalQuantity].toString(),
            totalWeight: element[_totalWeight].toString(),
            totalPrice: element[_totalPrice].toString());
        saleList.add(sale);
      }
    }
    return saleList;
  }

  Future<bool> checkExistSale(String id) async {
    final bool isExist;
    final List salesDB;

    salesDB = await supabase.from(_table).select().eq(_id, id);
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
    userName = pref.getString(_user)!;

    await supabase.from(_table).insert({
      _id: sale.uid,
      _client: sale.client,
      _time: sale.time,
      _locaction: sale.location,
      _vendor: userName,
      _totalPrice: sale.totalPrice,
      _totalQuantity: sale.totalQuantity,
      _totalWeight: sale.totalWeight,
      _product: sale.itemsShppc,
    });
  }

  Future<void> deleteSale(String id) async {
    await supabase.from(_table).delete().eq(_id, id);
  }

  read() {}
}
