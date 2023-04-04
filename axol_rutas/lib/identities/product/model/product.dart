class ProductModel {
  final String code;
  final String type;
  final String packing;
  final String capacity;
  final String measure;
  final String gauge;
  final String description;
  final String pices;
  final String weight;

  ProductModel(
      {required this.capacity,
      required this.code,
      required this.description,
      required this.gauge,
      required this.measure,
      required this.packing,
      required this.pices,
      required this.type,
      required this.weight});
}
