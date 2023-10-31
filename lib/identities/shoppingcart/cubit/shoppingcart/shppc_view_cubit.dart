import 'package:axol_rutas/identities/user/repository/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';

import '../../../inventory/repository/inventory_repo.dart';
import '../../../location/repository/location_repo.dart';
import '../../../sale/model/sale_model.dart';
import '../../../sale/model/sale_type_model.dart';
import '../../../sale/repository/sale_repo_hive.dart';
import '../../../sale/repository/sale_type_repo.dart';
import '../../../sale/repository/sales_repo.dart';
import '../../../user/model/user.dart';
import '../../model/shppc_view_model.dart';
import 'shppc_view_state.dart';

class ShppcViewCubit extends Cubit<ShppcViewState> {
  ShppcViewCubit() : super(InitialState());

  Future<void> initLoad() async {
    try {
      List<SaleTypeModel> saleTypeList;
      UserModel user;
      emit(InitialState());
      emit(LoadingState());
      user = await LocalUser().getLocalUser();
      saleTypeList = await SaleTypeRepo().fetchSaleTypeList(user);
      emit(PreLoadState(saleTypeList: saleTypeList, user: user));
      emit(LoadedState(isSaved: false));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  Future<void> load() async {
    try {
      //emit(InitialState());
      emit(LoadingState());
      emit(LoadedState(isSaved: false));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  Future<void> save(ShppcViewModel shppc) async {
    try {
      final bool isUpgradable;
      final Map<String, String> stockInventory;
      double updatedStock;
      final String idSale = const Uuid().v4();

      //emit(InitialState());
      emit(LoadingState());

      //Valida si las cantidades de stock no serán menores a cero una vez se
      //actualice.
      isUpgradable = await FetchInventory().checkAllStock(shppc.shoppingcart);

      if (isUpgradable == false) {
        throw Exception('Stock insuficiente en un producto.');
      }

      if (shppc.routeCustomer.id <= -1) {
        throw Exception('Seleccione un cliente valido.');
      }

      if (shppc.saleType == '') {
        throw Exception('Tipo de venta no valido.');
      }

      Position position = await LocationRepo().determinePosition();

      //Actualiza el inventario de la base de datos
      stockInventory = await FetchInventory().readInventoryProducts();
      for (var element in shppc.shoppingcart) {
        updatedStock = double.parse(stockInventory[element.product.code]!) -
            element.quantity;
        stockInventory[element.product.code] = updatedStock.toString();
      }

      //Crea un objeto sale con los datos de la venta, para luego ser enviado
      //con en el estado EntrySucces.
      Map<String, dynamic> products = {};
      int i = 0;
      for (var element in shppc.shoppingcart) {
        products[i.toString()] =
            '${element.product.code}//${element.quantity}//${element.product.weight}//${element.price}//${element.product.description}';
        i++;
      }
      SaleModel sale = SaleModel(
        uid: idSale,
        location: '${position.latitude},${position.longitude}',
        itemsShppc: products,
        client: '${shppc.routeCustomer.id}: ${shppc.routeCustomer.name}',
        time: shppc.dateTime.millisecondsSinceEpoch,
        totalQuantity: shppc.totalQuantity.toString(),
        totalWeight: shppc.totalWeight.toString(),
        totalPrice: shppc.totalPrice.toString(),
        note: '',
        type: shppc.saleType,
        status: '',
        lastEdit: '',
      );
      await SaleRepoHive().insert(sale);
      //await DatabaseSales().insertSale(sale); //Cambiar a Hive 

      //Acualiza sotck
      await Future.forEach(stockInventory.entries, (entry) async {
        await UpdateInventory()
            .updateStock(double.parse(entry.value), entry.key);
      });

      emit(LoadedState(isSaved: true));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
