import 'package:equatable/equatable.dart';

import '../../model/shoppingcart_models.dart';

abstract class SaveShoppingcartState extends Equatable {}

class InitialState extends SaveShoppingcartState {
  @override
  List<Object?> get props => [];
}

class EntryFailure extends SaveShoppingcartState {
  final String errorMessage;

  EntryFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class EntrySucces extends SaveShoppingcartState {
  final ShoppingcartResultsModel shoppingcartResults;

  EntrySucces({required this.shoppingcartResults});
  @override
  List<Object?> get props => [shoppingcartResults];
}

class ErrorState extends SaveShoppingcartState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;
  @override
  List<Object?> get props => [error];
}
