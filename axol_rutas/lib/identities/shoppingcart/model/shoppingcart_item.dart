import 'package:axol_rutas/identities/product/model/product.dart';

class ShoppingcartItemModel {
  final ProductModel product;
  final double quantity;
  final double price;

  const ShoppingcartItemModel(
      {required this.product, required this.quantity, required this.price});
}
