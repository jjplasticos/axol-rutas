class UserModel {
  final String name;
  final int id;
  final String rol;
  final String password;

  UserModel(
      {required this.name,
      required this.id,
      required this.rol,
      required this.password});

  static UserModel empty() =>
      UserModel(name: '', id: -1, rol: '', password: '');
}
