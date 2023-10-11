import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../user/model/user.dart';
import '../cubit/sales_cubit/sales_view_cubit.dart';
import '../model/sale_form_model.dart';
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
  final String _type = SaleModel.p_type;
  final String _note = SaleModel.p_note;
  //----
  //--Datos locales
  final String _user = 'user_name';
  //----
}

class DatabaseSales extends SalesRepo {
  final supabase = Supabase.instance.client;

  Future<List<SaleModel>> readSalesList(
      UserModel vendor, SaleFormModel form, int? range) async {
    SaleModel sale;
    Map<String, dynamic> element;
    List<SaleModel> newList = [];
    List<SaleModel> filterSales = [];
    final List<SaleModel> finalSales;
    List salesList = [];
    Map<String, dynamic> productsDB;
    int startTime = 0;
    int endTime = 32503708800000;
    const int dayMilli = 86400000;
    int initTime;
    DateTime startDate;
    DateTime endDate;

    startDate =
        DateTime(form.dateTime.year, form.dateTime.month, form.dateTime.day);
    endDate = DateTime(
        form.dateTime.year, form.dateTime.month, form.dateTime.day + 1);
    startTime = startDate.millisecondsSinceEpoch;
    endTime = endDate.millisecondsSinceEpoch;

    if (range != null) {
      initTime = dayMilli * range;
      startTime = startTime - initTime;
    }
    
    salesList = await supabase
        .from(_table)
        .select<List<Map<String, dynamic>>>()
        .eq(_vendor, vendor.name)
        .lte(_time, endTime)
        .gte(_time, startTime)
        .order(_time, ascending: true);

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
          totalPrice: element[_totalPrice].toString(),
          type: element[_type].toString(),
          note: element[_note].toString(),
        );
        newList.add(sale);
      }
    }
    bool isContain = false;
    DateTime time;
    String timeText;
    if (form.finder.text != '') {
      for (var item in newList) {
        time = DateTime.fromMillisecondsSinceEpoch(int.parse(item.time));
        timeText = '${time.day}/${time.month}/${time.year}';
        isContain = false;
        item.itemsShppc.forEach((key, value) {
          if (value
              .toString()
              .toLowerCase()
              .contains(form.finder.text.toLowerCase())) {
            isContain = true;
          }
        });
        if (item.client
                .toLowerCase()
                .contains(form.finder.text.toLowerCase()) ||
            timeText.contains(form.finder.text.toLowerCase())) {
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

  Future<List<SaleModel>> readListReport(
      SRepFormModel form, UserModel user) async {
    SaleModel sale;
    Map<String, dynamic> element;
    List<SaleModel> saleList = [];
    //final String userName;
    List<Map<String, dynamic>> salesDB = [];
    Map<String, dynamic> productsDB;
    //final String finder = form.finder.text;
    int startTime = 0;
    int endTime = 32503708800000;
    DateTime startDate;
    DateTime endDate;

    if (form.isTime) {
      startDate = DateTime(form.time.year, form.time.month, form.time.day);
      endDate = DateTime(form.time.year, form.time.month, form.time.day + 1);
      startTime = startDate.millisecondsSinceEpoch;
      endTime = endDate.millisecondsSinceEpoch;
    }
    salesDB = await supabase
        .from(_table)
        .select<List<Map<String, dynamic>>>()
        .eq(_vendor, user.name)
        .lte(_time, endTime)
        .gte(_time, startTime)
        .order(_time, ascending: true);

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
          totalPrice: element[_totalPrice].toString(),
          type: element[_type] ?? '',
          note: element[_note].toString(),
        );
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
      _type: sale.type,
    });
  }

  Future<void> deleteSale(String id) async {
    await supabase.from(_table).delete().eq(_id, id);
  }

  Future<void> initRealTime(UserModel user) async {
    
    await supabase.removeAllChannels();
    
    supabase.channel('public:sync:${user.id}').on(
        RealtimeListenTypes.postgresChanges,
        ChannelFilter(
          event: '*',
          schema: 'public',
          table: 'sync',
        ), (payload, [ref]) {
          if (int.parse(payload['new']['edited_by'].toString()) != user.id){
            print('payload: ${payload.toString()}');
          }
        //Agregar que hacer los datos recibidos.
    }).subscribe();
    print(supabase.getChannels().first.socket.endPointURL);
  }
}
