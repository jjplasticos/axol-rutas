class RouteCustomerModel {
  int id;
  String name;
  String location;
  int vendor;
  String address;
  String town;
  String country;
  String sector;
  Map<String, dynamic> validation;

  RouteCustomerModel(
      {required this.id,
      required this.name,
      required this.location,
      required this.address,
      required this.town,
      required this.country,
      required this.sector,
      required this.validation,
      required this.vendor});

  static const String pId = 'id';
  static const String pName = 'customer_name';
  static const String pLocation = 'location';
  static const String pVendor = 'vendor';
  static const String pAddress = 'address';
  static const String pSector = 'sector';
  static const String pTown = 'town';
  static const String pCountry = 'country';
  //-----Validation-----
  static const String pStatus = 'status';
  static const String pAdminUser = 'user';

  static RouteCustomerModel empty() => RouteCustomerModel(
        id: -1,
        address: '',
        location: '',
        name: '',
        validation: {},
        vendor: -1,
        country: '',
        sector: '',
        town: '',
      );
}
