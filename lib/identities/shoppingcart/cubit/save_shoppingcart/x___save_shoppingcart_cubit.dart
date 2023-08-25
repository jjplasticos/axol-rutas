// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';

import '../../../inventory/repository/inventory_repo.dart';
import '../../../sale/model/sale_model.dart';
import '../../../sale/repository/sales_repo.dart';
import '../../model/shoppingcart_models.dart';
import 'x___save_shoppingcart_state.dart';

/*class SaveShoppingcartCubit extends Cubit<SaveShoppingcartState> {
  SaveShoppingcartCubit() : super(InitialState());

  void verification(String customerName,
      ShoppingcartResultsModel shoppingcartResults, String timePick) async {
    const String MESSAGE1 = 'Ingrese el nombre del cliente.';
    const String MESSAGE2 =
        'Las cantidades de la venta superan el stock de inventario.';
    final bool isUpgradable;
    final bool isCustomerNotEmpty;
    final Map<String, String> stockInventory;
    final List<ShoppingcartItemModel> shoppingcart =
        shoppingcartResults.shoppingcart;
    double updatedStock;
    final String idSale = const Uuid().v4();
    final bool isExistSale;

    try {
      emit(InitialState());
      emit(LoadingState());

      //Valida si las cantidades de stock no serán menores a cero una vez se
      //actualice.
      isUpgradable = await FetchInventory().checkAllStock(shoppingcart);

      //Valida si el textfield de customerName no está vacío.
      if (customerName != '' || customerName.isNotEmpty) {
        isCustomerNotEmpty = true;
      } else {
        isCustomerNotEmpty = false;
      }

      Position position = await _determinePosition();

      //Si las validaciones son correctas... emite EntrySucces.
      if (isUpgradable == true && isCustomerNotEmpty == true) {
        //Actualiza el inventario de la base de datos
        stockInventory = await FetchInventory().readInventoryProducts();
        for (var element in shoppingcart) {
          updatedStock = double.parse(stockInventory[element.product.code]!) -
              element.quantity;
          stockInventory[element.product.code] = updatedStock.toString();
        }
        await Future.forEach(stockInventory.entries, (entry) async {
          await UpdateInventory()
              .updateStock(double.parse(entry.value), entry.key);
        });

        //Crea un objeto sale con los datos de la venta, para luego ser enviado
        //con en el estado EntrySucces.
        
        Map<String, dynamic> products = {};
        int i = 0;
        for (var element in shoppingcartResults.shoppingcart) {
          products[i.toString()] =
              '${element.product.code}//${element.quantity}//${element.price}//${element.product.description}';
          i++;
        }
        SaleModel sale = SaleModel(
            uid: idSale,
            location: '${position.latitude},${position.longitude}',
            products: products,
            client: customerName,
            time: timePick,
            totalQuantity: shoppingcartResults.totalQuantity.toString(),
            totalWeight: shoppingcartResults.totalWeight.toString(),
            totalPrice: shoppingcartResults.totalPrice.toString());
        DatabaseSales().writeSale(sale);
        isExistSale = await DatabaseSales().checkExistSale(idSale);
        if (isExistSale == true) {
          if (kDebugMode) {
            print('Ya esta la venta en la base de datos');
          }
        } else {
          if (kDebugMode) {
            print('Aun no esta la venta en la base de datos');
          }
        }
        emit(EntrySucces(shoppingcartResults: shoppingcartResults));

        //Si algunas de las validaciones no son correctas... emite EntryFilure.
      } else {
        if (isUpgradable == false) {
          emit(EntryFailure(errorMessage: MESSAGE2));
        } else if (isCustomerNotEmpty == false) {
          emit(EntryFailure(errorMessage: MESSAGE1));
        }
      }
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}

Future<Position> _determinePosition() async {
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