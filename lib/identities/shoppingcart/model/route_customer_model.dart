class RouteCustomerModel {
  int id;
  String name;
  String location;
  String vendor;
  Map<String, dynamic> address;
  Map<String, dynamic> validation;

  RouteCustomerModel(
      {required this.id,
      required this.name,
      required this.location,
      required this.address,
      required this.validation,
      required this.vendor});

  static const String pId = 'id';
  static const String pName = 'name';
  static const String pLocation = 'location';
  static const String pVendor = 'vendor';
  //-----Address-----
  static const String pAddress = 'address';
  static const String pHood = 'hood';
  static const String pTown = 'town';
  static const String pCountry = 'country';
  //-----Validation-----
  static const String pStatus = 'status';
  static const String pAdminUser = 'user';

  static RouteCustomerModel empty() => RouteCustomerModel(
    id: -1,
    address: {},
    location: '',
    name: '',
    validation: {},
    vendor: '',
  );
}