import '../../shoppingcart/model/shoppingcart_models.dart';

class SaleModel {
  final String uid;
  final String location;
  final Map<String, dynamic> products;
  final String client;
  final String time;
  final String totalQuantity;
  final String totalWeight;
  final String totalPrice;

  SaleModel(
      {required this.uid,
      required this.location,
      required this.products,
      required this.client,
      required this.time,
      required this.totalQuantity,
      required this.totalWeight,
      required this.totalPrice});
}
