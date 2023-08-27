import 'package:axol_rutas/identities/product/model/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../product/repository/product_repo.dart';
import '../../sale/model/sale_model.dart';
import '../model/shoppingcart_models.dart';

class ShoppingcartCubit extends Cubit<ShoppingcartResultsModel> {
  final ShoppingcartResultsModel initialState = ShoppingcartResultsModel(
      shoppingcart: [], totalQuantity: 0, totalPrice: 0, totalWeight: 0);

  ShoppingcartCubit()
      : super(ShoppingcartResultsModel(
            shoppingcart: [], totalQuantity: 0, totalPrice: 0, totalWeight: 0));

  void returnShoppingcart(List<ShoppingcartItemModel> shoppingcart) {
    emit(initialState);
    final ShoppingcartResultsModel shoppingcartResults;
    double totalPrice = 0;
    double totalQuantity = 0;
    double totalWeight = 0;
    for (var element in shoppingcart) {
      totalPrice = totalPrice + (element.price * element.quantity);
      totalQuantity = totalQuantity + element.quantity;
      totalWeight = totalWeight +
          (element.quantity * double.parse(element.product.weight));
    }
    shoppingcartResults = ShoppingcartResultsModel(
        shoppingcart: shoppingcart,
        totalQuantity: totalQuantity,
        totalPrice: totalPrice,
        totalWeight: totalWeight);

    emit(shoppingcartResults);
  }

  Future<void> saleToShoppingcart(SaleModel sale) async {
    final ShoppingcartResultsModel shoppingcartResults;
    List<ShoppingcartItemModel> shoppingcart;
    List<String> listStrings;
    ProductModel product;
    List<Future> futures = []; //Lista de futuros.

    try {
      shoppingcart = [];
      sale.itemsShppc.forEach((key, value) async {
        futures.add(DatabaseProducts()
            .readProduct(value.toString().split('//').elementAt(0))
            .then((value2) {
          listStrings = value.toString().split('//');
          product = value2!;
          shoppingcart.add(ShoppingcartItemModel(
              product: product,
              quantity: double.parse(listStrings.elementAt(1)),
              price: double.parse(listStrings.elementAt(2))));
        }));
      });
      await Future.wait(futures); //Espera a que se completen los futuros.
      shoppingcartResults = ShoppingcartResultsModel(
        shoppingcart: shoppingcart,
        totalQuantity: double.parse(sale.totalQuantity),
        totalPrice: double.parse(sale.totalPrice),
        totalWeight: double.parse(sale.totalWeight),
      );
      emit(shoppingcartResults);
    } catch (e) {
      if (kDebugMode) {
        print('Error en saleToShoppingcart: $e');
      }
    }
  }
}
