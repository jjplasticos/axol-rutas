class ProductModel {
  final String code;
  final String type;
  final String packing;
  final String capacity;
  final String measure;
  final String gauge;
  final String description;
  final String pieces;
  final String weight;
  final String filetValues;

  ProductModel(
      {required this.capacity,
      required this.code,
      required this.description,
      required this.gauge,
      required this.measure,
      required this.packing,
      required this.pieces,
      required this.type,
      required this.weight,
      required this.filetValues});

  static ProductModel empty() => ProductModel(
    capacity: '', 
    code: '', 
    description: '', 
    gauge: '', 
    measure: '', 
    packing: '', 
    pieces: '', 
    type: '', 
    weight: '', 
    filetValues: '',);
}
