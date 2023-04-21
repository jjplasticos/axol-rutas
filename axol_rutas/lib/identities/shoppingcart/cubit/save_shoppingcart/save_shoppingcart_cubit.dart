// ignore_for_file: constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';

import '../../../inventory/repository/inventory_repo.dart';
import '../../../sale/model/sale.dart';
import '../../../sale/repository/sales_repo.dart';
import '../../model/shoppingcart_models.dart';
import 'save_shoppingcart_state.dart';

class SaveShoppingcartCubit extends Cubit<SaveShoppingcartState> {
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

    try {
      emit(InitialState());

      //Valida si las cantidades de stock no serán menores a cero una vez se
      //actualice.
      isUpgradable = await FetchInventory().checkAllStock(shoppingcart);

      //Valida si el textfield de customerName no está vacío.
      if (customerName != '' || customerName.isNotEmpty) {
        isCustomerNotEmpty = true;
      } else {
        isCustomerNotEmpty = false;
      }

      //Si las validaciones son correctas... emite EntrySucces.
      if (isUpgradable == true && isCustomerNotEmpty == true) {
        //Actualiza el inventario de la base de datos
        stockInventory = await FetchInventory().readInventoryProducts();
        for (var element in shoppingcart) {
          updatedStock = double.parse(stockInventory[element.product.code]!) -
              element.quantity;
          UpdateInventory().updateStock(updatedStock, element.product.code);
        }
        //Crea un objeto sale con los datos de la venta, para luego ser enviado
        //con en el estado EntrySucces.
        Position position = await Geolocator.getCurrentPosition();
        Map<String, dynamic> products = {};
        for (var element in shoppingcartResults.shoppingcart) {
          products[element.product.code] =
              '${element.quantity}//${element.price}';
        }
        SaleModel sale = SaleModel(
            uid: const Uuid().v4(),
            location: '${position.latitude},${position.longitude}',
            products: products,
            client: customerName,
            time: timePick,
            totalQuantity: shoppingcartResults.totalQuantity.toString(),
            totalWeight: shoppingcartResults.totalWeight.toString(),
            totalPrice: shoppingcartResults.totalPrice.toString());
        DatabaseSales().writeSale(sale);
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
