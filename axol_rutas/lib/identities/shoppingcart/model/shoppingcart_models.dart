import 'package:axol_rutas/identities/product/model/product.dart';

abstract class ShoppingcartModel {}

class ShoppingcartItemModel extends ShoppingcartModel {
  final ProductModel product;
  final double quantity;
  final double price;

  ShoppingcartItemModel(
      {required this.product, required this.quantity, required this.price});
}

class ShoppingcartResultsModel extends ShoppingcartModel {
  final List<ShoppingcartItemModel> shoppingcart;
  final double totalQuantity;
  final double totalPrice;
  final double totalWeight;

  ShoppingcartResultsModel(
      {required this.shoppingcart,
      required this.totalQuantity,
      required this.totalPrice,
      required this.totalWeight});
}
