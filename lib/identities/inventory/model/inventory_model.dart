import '../../product/model/product.dart';

class InventoryModel {
  InventoryModel(
      {required this.uid,
      required this.code,
      required this.name,
      //required this.retailManager,
      required this.stock,
      required this.product,
      //required this.properties,
      });

  final String uid;
  //final String retailManager;
  final String code;
  final String name;
  final String stock;
  final ProductModel product;
  //final Map properties;
}
