import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../globals/global_widgets/global_models/textfield_model.dart';
import '../../user/model/user.dart';
import '../model/sale_form_model.dart';
import '../model/sale_model.dart';
import 'sales_repo.dart';

class SaleRepoHive {
  final String _id = SaleModel.p_id;
  final String _location = SaleModel.p_location;
  final String _clientName = SaleModel.p_client;
  final String _time = SaleModel.p_time;
  final String _vendor = 'vendor';
  final String _totalPrice = SaleModel.p_totalPrice;
  final String _totalQuantity = SaleModel.p_totalQuantity;
  final String _totalWeight = SaleModel.p_totalWeight;
  final String _productList = SaleModel.p_itemsShoppc;
  final String _type = SaleModel.p_type;
  final String _note = SaleModel.p_note;

  void initBoxes(UserModel vendor) async {
    List<SaleModel> salesDB;
    SaleFormModel formModel = SaleFormModel(
      finder: TextfieldModel.empty(),
      dateTime: DateTime.now(),
    );

    var saleBox = Hive.box('saleBox');

    salesDB = await DatabaseSales().readSalesList(vendor, formModel, 30);
    //print('Length salesDB: ${salesDB.length}');
    await saleBox.clear();
    for (var saleIn in salesDB) {
      saleBox.put(
        saleIn.uid,
        {
          _id: saleIn.uid,
          _location: saleIn.location,
          _clientName: saleIn.client,
          _time: saleIn.time,
          _totalPrice: saleIn.totalPrice,
          _totalQuantity: saleIn.totalQuantity,
          _totalWeight: saleIn.totalWeight,
          _productList: saleIn.itemsShppc,
          _type: saleIn.type,
          _note: saleIn.note
        },
      );
    }
  }

  void updateDB(UserModel vendor) async {
  } 

  void testHive() async {
    var saleBox = Hive.box('saleBox');
    int i = 0;
    //String saleId;
    print('Length box: ${saleBox.length}');
    /*for (int i = 0; i < saleBox.length; i++) {
      print('$i : ${saleBox.getAt(i)}');
    }*/
    for (var value in saleBox.values) {
      print('$i : $value');
      i = i + 1;
    }
  }
}