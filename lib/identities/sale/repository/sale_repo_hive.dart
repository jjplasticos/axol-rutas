import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../globals/global_widgets/global_models/textfield_model.dart';
import '../../user/model/user.dart';
import '../model/sale_form_model.dart';
import '../model/sale_model.dart';
import 'sales_repo.dart';

class SaleRepoHive {
  final String _id = SaleModel.pId;
  final String _location = SaleModel.pLocation;
  final String _clientName = SaleModel.pClient;
  final String _time = SaleModel.pTime;
  final String _vendor = 'vendor';
  final String _totalPrice = SaleModel.pTotalPrice;
  final String _totalQuantity = SaleModel.pTotalQuantity;
  final String _totalWeight = SaleModel.pTotalWeight;
  final String _productList = SaleModel.pItemsShoppc;
  final String _type = SaleModel.pType;
  final String _note = SaleModel.pNote;
  final String _status = SaleModel.pStatus;

  //status const
  final String _sync = 'sync';
  final String _update = 'update';
  final String _insert = 'insert';
  final String _delete = 'delete';

  final _saleBox = Hive.box('saleBox');

  void initBoxes(UserModel vendor) async {
    List<SaleModel> salesDB;
    SaleFormModel formModel = SaleFormModel(
      finder: TextfieldModel.empty(),
      dateTime: DateTime.now(),
    );

    //var saleBox = Hive.box('saleBox');

    salesDB = await DatabaseSales().readSalesList(vendor, formModel, 30);
    //print('Length salesDB: ${salesDB.length}');
    await _saleBox.clear();
    for (var saleIn in salesDB) {
      _saleBox.put(saleIn.uid, _saleToMap(saleIn, _sync));
    }
  }

  void synDown(UserModel vendor) async {
    List<SaleModel> salesDB;
    SaleFormModel formModel = SaleFormModel(
      finder: TextfieldModel.empty(),
      dateTime: DateTime.now(),
    );
    List<SaleModel> sales = [];
    SaleModel sale;

    for (var element in _saleBox.values) {
      if (element is SaleModel) {
        sales.add(element);
      }
    }
    salesDB = await DatabaseSales().readSalesList(vendor, formModel, 30);

    for (var saleIn in salesDB) {
      if (sales.where((x) => x.uid == saleIn.uid).isEmpty) {
        _saleBox.put(saleIn.uid, _saleToMap(saleIn, _sync));
      }
    }
    for (int i = 0; i < _saleBox.length; i++) {
      sale = _saleBox.getAt(i);
      if (salesDB.where((y) => y.uid == sale.uid).isEmpty) {
        _saleBox.deleteAt(i);
      }
    }
  }

  void syncUp() async {
    bool exist = false;
    List<SaleModel> sales = [];
    SaleModel sale;

    for (var element in _saleBox.values) {
      if (element is SaleModel) {
        sales.add(element);
      }
    }
    for (int i = 0; i < sales.length; i++) {
      sale = sales.elementAt(i);
      if (sale.status == _update) {
        //Actualiza en la base de datos.
      }
      if (sales.elementAt(i).status == _insert) {
        //Busca si el id existe en la base de datos
        exist = await DatabaseSales().checkExistSale(sale.uid);
        if (exist) {
          //Si no existe inserta en la base de datos
          await DatabaseSales().insertSale(sale);
        } else {
          //Si existe cambia a sync
          _saleBox.putAt(i, _saleToMap(sale, _sync));
        }
      }
      if (sales.elementAt(i).status == _delete) {
        //Elimina en la base de datos
      }
    }
  }

  void testHive() async {
    //var saleBox = Hive.box('saleBox');
    int i = 0;
    //String saleId;
    print('Length box: ${_saleBox.length}');
    /*for (int i = 0; i < saleBox.length; i++) {
      print('$i : ${saleBox.getAt(i)}');
    }*/
    for (var value in _saleBox.values) {
      print('$i : $value');
      i = i + 1;
    }
  }

  Map<String, dynamic> _saleToMap(SaleModel sale, String status) {
    Map<String, dynamic> map = {
      _id: sale.uid,
      _location: sale.location,
      _clientName: sale.client,
      _time: sale.time,
      _totalPrice: sale.totalPrice,
      _totalQuantity: sale.totalQuantity,
      _totalWeight: sale.totalWeight,
      _productList: sale.itemsShppc,
      _type: sale.type,
      _note: sale.note,
      _status: status,
    };
    return map;
  }
}
