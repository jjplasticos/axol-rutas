import 'dart:convert';

import 'package:axol_rutas/identities/product/model/product.dart';
import 'package:axol_rutas/identities/product/repository/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/inventory_repo.dart';
import 'lists_products_state.dart';

class ProductsListCubit extends Cubit<ListsProductsState> {
  ProductsListCubit() : super(InitialState());

  void productsInventory() async {
    List mapProductList;
    try {
      emit(LoadingState());
      DatabaseInventory databaseInventory = DatabaseInventory();
      final List<Map<String, String>> productsList =
          await databaseInventory.readInventoryProducts();
      final List<String> codes = await databaseInventory.readInventoryCodes();
      mapProductList =
          await productsToProducts(codes); //Pasar a map!!!!!!!! Seguir aquí <--
      emit(LoadedState(inventoryProducts: productsList));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  void productsShoppingCart() async {
    try {
      emit(LoadingState());
      emit(LoadedState(inventoryProducts: []));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  Future<List<ProductModel>> productsToProducts(List<String> codes) async {
    ProductModel productModel;
    List<ProductModel> productModelList = [];
    DatabaseProducts databaseProducts = DatabaseProducts();
    Map element;
    Map<String, dynamic> productMap;
    final List<Map> productsList =
        await databaseProducts.readProductList(codes);

    for (element in productsList) {
      productModel = ProductModel(
          capacity: element['capacity'],
          code: element['code'],
          description: element['description'],
          gauge: element['gauge'],
          measure: element['measure'],
          packing: element['packing'],
          type: element['type'],
          weight: element['weight'],
          pices: element['pices']);
      productModelList.add(productModel);
    }

    return productModelList;
  }
}
