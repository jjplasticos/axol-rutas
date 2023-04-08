import 'package:axol_rutas/identities/product/model/product.dart';
import 'package:axol_rutas/identities/product/repository/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/inventory_repo.dart';
import 'lists_products_state.dart';

class ProductsListCubit extends Cubit<ListsProductsState> {
  ProductsListCubit() : super(InitialState());

  void productsInventory(String filter) async {
    Map<String, ProductModel> mapProducts;
    String code;
    List<Map<String, dynamic>> inventoryList = [];
    Map<String, dynamic> productWithStock;
    try {
      emit(LoadingState());
      DatabaseInventory databaseInventory = DatabaseInventory();
      final Map<String, String> mapSotcks =
          await databaseInventory.readInventoryProducts();
      final List<String> codes = await databaseInventory.readInventoryCodes();
      mapProducts = await productsToProducts(codes, filter);
      final List newCodes = codes.where((element) => mapProducts.containsKey(element)).toList();
      for (code in newCodes) {
        productWithStock = {
          'ProductModel': mapProducts[code],
          'Stock': mapSotcks[code]
        };
        inventoryList.add(productWithStock);
      }

      emit(LoadedState(inventoryProducts: inventoryList));
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

  Future<Map<String, ProductModel>> productsToProducts(
      List<String> codes, String filter) async {
    ProductModel productModel;
    DatabaseProducts databaseProducts = DatabaseProducts();
    Map element;
    Map<String, ProductModel> productMap = {};
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
          pices: element['pices'],
          filetValues: element['code'] + '//' + element['description'] + '//' + element['packing']);
      productMap[productModel.code.toString()] = productModel;
    }
    final Map<String, ProductModel> result = Map.fromEntries(
        productMap.entries.where((entry) => entry.value.filetValues.toLowerCase().contains(filter.toLowerCase())));
    //print(result.toString());

    return result;
  }
}
