import 'package:axol_rutas/identities/shoppingcart/model/shoppingcart_item.dart';
import 'package:equatable/equatable.dart';

abstract class OptionsShppcItemState extends Equatable {}

class InitialState extends OptionsShppcItemState {
  @override
  List<Object?> get props => [];
}

class EditState extends OptionsShppcItemState {
  final String stock;
  final List<ShoppingcartItemModel> shoppingcart;
  final int index;

  EditState(
      {required this.stock, required this.shoppingcart, required this.index});

  @override
  List<Object?> get props => [stock, shoppingcart, index];
}

class DeleteState extends OptionsShppcItemState {
  final List<ShoppingcartItemModel> shoppingcart;
  final int index;
  DeleteState(
      {required this.shoppingcart, required this.index});
  @override
  List<Object?> get props => [shoppingcart, index];
}

class CancelState extends OptionsShppcItemState {
  final List<ShoppingcartItemModel> shoppingcart;
  CancelState({required this.shoppingcart});
  @override
  List<Object?> get props => [shoppingcart];
}

class ErrorState extends OptionsShppcItemState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;
  @override
  List<Object?> get props => [error];
}
