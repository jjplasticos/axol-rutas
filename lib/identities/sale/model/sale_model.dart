import '../../product/model/product.dart';

class SaleModel {
  final String uid;
  final String location;
  final Map<String, dynamic> itemsShppc;
  final String client;
  final String time;
  final String totalQuantity;
  final String totalWeight;
  final String totalPrice;

  static const String p_id = 'id';
  static const String p_location = 'location';
  static const String p_itemsShoppc = 'product_list';
  static const String p_client = 'client_name';
  static const String p_time = 'time';
  static const String p_totalQuantity = 'total_quantity';
  static const String p_totalWeight = 'total_weight';
  static const String p_totalPrice = 'total_price';

  SaleModel(
      {required this.uid,
      required this.location,
      required this.itemsShppc,
      required this.client,
      required this.time,
      required this.totalQuantity,
      required this.totalWeight,
      required this.totalPrice,
      });

  static SaleModel empty() => SaleModel(
    uid: '', 
    location: '', 
    itemsShppc: {}, 
    client: '', 
    time: '', 
    totalQuantity: '', 
    totalWeight: '', 
    totalPrice: '');
}
