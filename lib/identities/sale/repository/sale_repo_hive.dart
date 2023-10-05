import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../user/model/user.dart';
import '../model/sale_form_model.dart';
import '../model/sale_model.dart';
import 'sales_repo.dart';

class SaleRepoHive {
  void initBoxes(UserModel vendor, SaleFormModel form) async {
    List<SaleModel> salesDB;

    var saleBox = Hive.box('saleBox');

    salesDB = await DatabaseSales().readSalesList(vendor, form);
    print('Length salesDB: ${salesDB.length}');
    await saleBox.clear();
    for (var saleIn in salesDB) {
      saleBox.put(saleIn.uid, saleIn.uid);
    }
    /*var box = Hive.box('myBox');
    box.put('name', 'David');
    var name = box.get('name');
    print('Name: $name');*/
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

class SaleAdapter extends TypeAdapter<SaleModel> {
  @override
  final typeId = 1;

  @override
  SaleModel read(BinaryReader reader) {
    return SaleModel(
      uid: reader.read(),
      client: reader.read(),
      itemsShppc: reader.read(),
      location: reader.read(),
      note: reader.read(),
      time: reader.read(),
      totalPrice: reader.read(),
      totalQuantity: reader.read(),
      totalWeight: reader.read(),
      type: reader.read(),
      );
  }

  @override
  void write(BinaryWriter writer, SaleModel obj) {
    writer.write(obj.uid);
    writer.write(obj.client);
    writer.write(obj.itemsShppc);
    writer.write(obj.location);
    writer.write(obj.note);
    writer.write(obj.time);
    writer.write(obj.totalPrice);
    writer.write(obj.totalQuantity);
    writer.write(obj.totalWeight);
    writer.write(obj.type);
  }
}
