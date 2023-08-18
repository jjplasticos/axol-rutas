class ShppcitemFormModel {
  String quantity;
  String price;

  ShppcitemFormModel({required this.quantity, required this.price});

  static ShppcitemFormModel empty() => ShppcitemFormModel(quantity: '', price: '');
}