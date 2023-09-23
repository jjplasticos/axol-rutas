class SaleTypeModel {
  final int id;
  final String type;
  final String userList;

  SaleTypeModel({
    required this.id,
    required this.type,
    required this.userList,
  });

  static SaleTypeModel empty() => SaleTypeModel(
    id: -1, 
    type: '', 
    userList: '',
    );
}