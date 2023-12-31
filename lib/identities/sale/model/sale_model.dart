class SaleModel {
  final String uid;
  final String location;
  final Map<String, dynamic> itemsShppc;
  final String client;
  final int time;
  final String totalQuantity;
  final String totalWeight;
  final String totalPrice;
  final String type;
  final String note;
  final String status;
  final String lastEdit;

  static const String pId = 'id';
  static const String pLocation = 'location';
  static const String pItemsShoppc = 'product_list';
  static const String pClient = 'client_name';
  static const String pTime = 'time';
  static const String pTotalQuantity = 'total_quantity';
  static const String pTotalWeight = 'total_weight';
  static const String pTotalPrice = 'total_price';
  static const String pType = 'type';
  static const String pNote = 'note';
  static const String pStatus = 'status';
  static const String pLastEdit = 'last_edit';
  
  //---Status---
  static const String stSync = 'sync';
  static const String stInsert = 'insert';
  static const String stUpdate = 'update';
  static const String stDelete = 'delete';

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
    required this.status,
    required this.lastEdit,
  });

  static SaleModel empty() => SaleModel(
      uid: '',
      location: '',
      itemsShppc: {},
      client: '',
      time: 0,
      totalQuantity: '',
      totalWeight: '',
      totalPrice: '',
      type: '',
      note: '', 
      status: '',
      lastEdit: '',
      );
}
