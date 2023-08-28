import '../../product/model/product.dart';

class SaleReportModel {
  final ProductModel product;
  final DateTime dateTime;
  int quantitySold;
  final int unitPrice;
  int totalPrice;
  
  SaleReportModel({
    required this.product,
    required this.dateTime,
    required this.quantitySold,
    required this.unitPrice,
    required this.totalPrice,
  });

  static SaleReportModel empty() => SaleReportModel(
    product: ProductModel.empty(), 
    dateTime: DateTime(0), 
    quantitySold: 0, 
    unitPrice: 0, 
    totalPrice: 0,
    );
}