import 'route_customer_model.dart';
import 'shoppingcart_models.dart';

class ShppcViewModel {
  List<ShoppingcartItemModel> shoppingcart;
  double totalQuantity;
  double totalPrice;
  double totalWeight;
  RouteCustomerModel routeCustomer;
  DateTime dateTime;

  ShppcViewModel ({
    required this.shoppingcart,
    required this.totalPrice,
    required this.totalQuantity,
    required this.totalWeight,
    required this.routeCustomer,
    required this.dateTime,
  });

  static ShppcViewModel empty() => ShppcViewModel(
    shoppingcart: [],
    dateTime: DateTime.now(),
    routeCustomer: RouteCustomerModel.empty(),
    totalPrice: 0,
    totalQuantity: 0,
    totalWeight: 0,
  );
}