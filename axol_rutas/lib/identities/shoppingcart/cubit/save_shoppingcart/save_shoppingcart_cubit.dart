// ignore_for_file: constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';

import '../../../sale/model/sale.dart';
import '../../../sale/repository/sales_repo.dart';
import '../../model/shoppingcart_models.dart';
import 'save_shoppingcart_state.dart';

class SaveShoppingcartCubit extends Cubit<SaveShoppingcartState> {
  SaveShoppingcartCubit() : super(InitialState());

  void verification(String customerName,
      ShoppingcartResultsModel shoppingcartResults, String timePick) async {
    const String MESSAGE1 = 'Ingrese el nombre de un cliente';

    try {
      emit(InitialState());

      if (customerName != '' || customerName.isNotEmpty) {
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
      } else {
        emit(EntryFailure(errorMessage: MESSAGE1));
      }
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
