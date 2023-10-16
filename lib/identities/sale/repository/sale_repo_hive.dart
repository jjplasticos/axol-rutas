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
  final String _lastEdit = SaleModel.pLastEdit;

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
    Map<String, dynamic> map;
    int? timeEditLocal;
    int? timeEditDb;
    
    for (var element in _saleBox.values) {
      if (element is SaleModel) {
        sales.add(element);
      }
    }
    salesDB = await DatabaseSales().readSalesList(vendor, formModel, 30);

    //Por cada elemento de la lista de ventas tomada de la base de datos
    //compara con cada elemento de las ventas en la base de datos local.
    for (var saleIn in salesDB) {
      //Si la id del elemento de saleDB no existe en la base local,
      //la inserta en la base de datos local.
      if (sales.where((x) => x.uid == saleIn.uid).isEmpty) {
        _saleBox.put(saleIn.uid, _saleToMap(saleIn, _sync));
      } else {
        //De lo contrario, si la id existe, verifica que no se haya modificado
        //comparando sus ultimos tiempos de edicion. Si el tiempo de la base 
        //de datos local es menor al de la nube, actualiza la venta.
        for (int i = 0; i < _saleBox.length; i++) {
          timeEditDb = int.tryParse(saleIn.lastEdit.split(',').last);
          timeEditLocal = int.tryParse(
              _saleBox.getAt(i)[_lastEdit].toString().split(',').last);
          if (timeEditDb != null && timeEditLocal != null) {
            if (timeEditDb > timeEditLocal) {
              _saleBox.putAt(i, _saleToMap(saleIn, _sync));
            }
          }
        }
      }
    }
    //Compara cada venta de la base local con las ventas de la nube,
    //alguna venta no existe en la nube, la elimina de la base de datos
    //lcoal.
    for (int i = 0; i < _saleBox.length; i++) {
      map = _saleBox.getAt(i);
      sale = SaleModel(
        uid: map[_id],
        client: map[_clientName],
        itemsShppc: map[_productList],
        location: map[_location],
        note: map[_note],
        time: map[_time],
        totalPrice: map[_totalPrice],
        totalQuantity: map[_totalQuantity],
        totalWeight: map[_totalWeight],
        type: map[_type],
        status: map[_status],
        lastEdit: map[_lastEdit],
      );
      if (salesDB.where((y) => y.uid == sale.uid).isEmpty &&
          sale.status == _sync) {
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

  void insert(SaleModel sale) async {
    if (_saleBox.values.where((x) => x.uid == sale.uid).isEmpty) {
      _saleBox.add(_saleToMap(sale, _insert));
    }
  }

  void printValues() async {
    for (var element in _saleBox.values) {
      print(element);
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
