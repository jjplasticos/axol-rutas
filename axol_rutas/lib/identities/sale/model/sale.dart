class SaleModel {
  final String uid;
  final String location;
  final List<Map<String, dynamic>> products;
  final String client;
  final String time;
  final double totalQuantity;
  final double totalWeight;
  final double totalPrice;

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
