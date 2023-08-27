import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';

import '../../../inventory/repository/inventory_repo.dart';
import '../../../location/repository/location_repo.dart';
import '../../../sale/model/sale_model.dart';
import '../../../sale/repository/sales_repo.dart';
import '../../model/shppc_view_model.dart';
import 'shppc_view_state.dart';

class ShppcViewCubit extends Cubit<ShppcViewState> {
  ShppcViewCubit() : super(InitialState());

  Future<void> load() async {
    try {
      emit(InitialState());
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

      emit(InitialState());
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
          time: shppc.dateTime.millisecondsSinceEpoch.toString(),
          totalQuantity: shppc.totalQuantity.toString(),
          totalWeight: shppc.totalWeight.toString(),
          totalPrice: shppc.totalPrice.toString());
      await DatabaseSales().writeSale(sale);

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

  /*Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }*/
}
