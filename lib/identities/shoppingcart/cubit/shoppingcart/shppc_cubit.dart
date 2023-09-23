import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../sale/model/sale_type_model.dart';
import '../../model/route_customer_model.dart';
import '../../model/shoppingcart_models.dart';
import '../../model/shppc_view_model.dart';

class ShppcCubit extends Cubit<ShppcViewModel> {
  ShppcCubit() : super(ShppcViewModel.empty());

  Future<void> changeCustomer(RouteCustomerModel rc) async {
    ShppcViewModel shppcView = state;
    shppcView.routeCustomer = rc;
    emit(ShppcViewModel.empty());
    emit(shppcView);
  }

  Future<void> changeShppc(List<ShoppingcartItemModel> shppc) async {
    ShppcViewModel shppcView = state;
    double totalPrice = 0;
    double totalQuantity = 0;
    double totalWeight = 0;
    
    for (var element in shppc) {
      totalPrice = totalPrice + (element.price * element.quantity);
      totalQuantity = totalQuantity + element.quantity;
      totalWeight = totalWeight +
          (element.quantity * double.parse(element.product.weight));
    }

    shppcView.totalPrice = totalPrice;
    shppcView.totalQuantity = totalQuantity;
    shppcView.totalWeight = totalWeight;
    shppcView.shoppingcart = shppc;

    emit(ShppcViewModel.empty());
    emit(shppcView);
  }

  Future<void> changeSaleType(List<SaleTypeModel> saleTypeList) async {
    ShppcViewModel shppcView = state;
    shppcView.saleTypeList;
    emit(ShppcViewModel.empty());
    emit(shppcView);
  }
}