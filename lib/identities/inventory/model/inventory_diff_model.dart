import '../../product/model/product.dart';

class InventoryDiffModel {
  final ProductModel product;
  final double stock;
  final double actualStock;
  final bool isCheck;

  InventoryDiffModel({
    required this.product,
    required this.stock,
    required this.actualStock,
    required this.isCheck, 
  });

  static InventoryDiffModel empty() => InventoryDiffModel(
    product: ProductModel.empty(), 
    stock: 0, 
    actualStock: 0,
    isCheck: false,
    );
}