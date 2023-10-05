import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class SaleModel {
  final String uid;
  final String location;
  final Map<String, dynamic> itemsShppc;
  final String client;
  final String time;
  final String totalQuantity;
  final String totalWeight;
  final String totalPrice;
  final String type;
  final String note;

  static const String p_id = 'id';
  static const String p_location = 'location';
  static const String p_itemsShoppc = 'product_list';
  static const String p_client = 'client_name';
  static const String p_time = 'time';
  static const String p_totalQuantity = 'total_quantity';
  static const String p_totalWeight = 'total_weight';
  static const String p_totalPrice = 'total_price';
  static const String p_type = 'type';
  static const String p_note = 'note';

  SaleModel({
    required this.uid,
    required this.location,
    required this.itemsShppc,
    required this.client,
    required this.time,
    required this.totalQuantity,
    required this.totalWeight,
    required this.totalPrice,
    required this.type,
    required this.note,
  });

  static SaleModel empty() => SaleModel(
      uid: '',
      location: '',
      itemsShppc: {},
      client: '',
      time: '',
      totalQuantity: '',
      totalWeight: '',
      totalPrice: '',
      type: '',
      note: '');
}

/*@HiveType(typeId: 0)
class SaleObjHive extends HiveObject{
  @HiveField(0)
  String uid;
}*/
