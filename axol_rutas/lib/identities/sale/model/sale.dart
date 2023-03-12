class Sale {
  Sale(this.uid, this.location, this.products, this.client, this.time,
      this.totalQuantity, this.totalWeight, this.totalPrice);

  final String uid;
  final String location;
  final List<Map<String, dynamic>> products;
  final String client;
  final String time;
  final double totalQuantity;
  final double totalWeight;
  final double totalPrice;
}
