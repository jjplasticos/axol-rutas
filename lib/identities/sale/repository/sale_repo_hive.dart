import 'package:hive/hive.dart';

import '../../user/model/user.dart';
import '../model/sale_form_model.dart';
import '../model/sale_model.dart';
import 'sales_repo.dart';

class SaleRepoHive {
  void initBoxes(UserModel vendor, SaleFormModel form) async {
    List<SaleModel> salesDB;

    var saleBox = Hive.box('saleBox');

    salesDB = await DatabaseSales().readSalesList(vendor, form);

    for (var saleIn in salesDB) {
      //saleBox.put()
    }
    /*var box = Hive.box('myBox');
    box.put('name', 'David');
    var name = box.get('name');
    print('Name: $name');*/
  }
}
