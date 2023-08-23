import 'package:equatable/equatable.dart';

import '../../../shoppingcart/model/shoppingcart_models.dart';

abstract class SaleDetailState extends Equatable {}

class InitialState extends SaleDetailState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends SaleDetailState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends SaleDetailState {
  final List<ShoppingcartItemModel> shppc;
  LoadedState({required this.shppc});
  @override
  List<Object?> get props => [shppc];
}

class ErrorState extends SaleDetailState {
  final String error;
  ErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}
