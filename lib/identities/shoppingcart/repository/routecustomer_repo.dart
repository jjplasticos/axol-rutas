import 'package:supabase_flutter/supabase_flutter.dart';

import '../../user/model/user.dart';
import '../../user/repository/user_repo.dart';
import '../model/route_customer_model.dart';

class RoutecustomerRepo {
  static const String _table = 'route_customer';
  static const String _id = 'id';
  static const String _name = 'customer_name';
  static const String _location = 'location';
  static const String _validation = 'validation';
  static const String _address = 'address';
  static const String _vendor = 'vendor';
  static const String _country = RouteCustomerModel.pCountry;
  static const String _sector = RouteCustomerModel.pSector;
  static const String _town = RouteCustomerModel.pTown;
  final _supabase = Supabase.instance.client;

  Future<List<RouteCustomerModel>> fetchRcList(String finder) async {
    UserModel user = await LocalUser().getLocalUser();
    List<Map<String, dynamic>> customersDB = [];
    RouteCustomerModel routcustomer;
    List<RouteCustomerModel> customers = [];
    if (finder == '') {
      customersDB = await _supabase
          .from(_table)
          .select<List<Map<String, dynamic>>>()
          .eq(_vendor, user.id);
    } else {
      customersDB = await _supabase
          .from(_table)
          .select<List<Map<String, dynamic>>>()
          .eq(_vendor, user.id)
          .ilike(_name, '%$finder%');
    }
    if (customersDB.isNotEmpty) {
      for (var element in customersDB) {
        routcustomer = RouteCustomerModel(
          id: element[_id],
          name: element[_name],
          location: element[_location],
          address: element[_address],
          validation: element[_validation],
          vendor: element[_vendor],
          country: element[_country],
          sector: element[_sector] ?? '',
          town: element[_town],
        );
        customers.add(routcustomer);
      }
    }
    return customers;
  }

  Future<bool> existId(String id) async {
    List<Map<String, dynamic>> customersDB = [];
    List<RouteCustomerModel> customers = [];
    bool exist;
    customersDB = await _supabase
        .from(_table)
        .select<List<Map<String, dynamic>>>()
        .eq(_id, id);
    if (customersDB.isEmpty) {
      exist = false;
    } else {
      exist = true;
    }
    return exist;
  }

  Future<int> availableId() async {
    List<Map<String, dynamic>> customerIdDB = [];
    List<int> listId = [];
    int newId = -1;
    customerIdDB =
        await _supabase.from(_table).select<List<Map<String, dynamic>>>(_id);
    for (var element in customerIdDB) {
      listId.add(int.parse(element[_id].toString()));
    }
    listId.sort((a, b) => a.compareTo(b));
    for (int i = 1; i <= listId.length; i++) {
      if (listId.contains(i) == false) {
        listId.add(i);
        newId = i;
        i = listId.length + 1;
      }
    }
    return newId;
  }

  Future<void> insertRc(RouteCustomerModel routcustomer, int vendor) async {
    await _supabase.from(_table).insert({
      _id: routcustomer.id,
      _name: routcustomer.name,
      _location: routcustomer.location,
      _address: routcustomer.address,
      _validation: routcustomer.validation,
      _vendor: vendor,
      _country: routcustomer.country,
      _town: routcustomer.town,
      _sector: routcustomer.sector,
    });
  }

  Future<void> updateRcValidation(RouteCustomerModel rc) async {
    await _supabase.from(_table).update({
      _validation: rc.validation,
    }).eq(_id, rc.id);
  }
}
