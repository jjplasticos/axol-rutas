class ClassProductModel {
  final int id;
  final String text1;

  ClassProductModel({
    required this.id,
    required this.text1,
  });

  static ClassProductModel empty() => ClassProductModel(id: -1, text1: '');
}