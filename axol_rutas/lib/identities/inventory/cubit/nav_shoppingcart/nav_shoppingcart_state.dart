import 'package:equatable/equatable.dart';

abstract class NavShoppingcartState extends Equatable {}

class InitialState extends NavShoppingcartState {
  @override
  List<Object?> get props => [];
}

class SavingShoppingcartState extends NavShoppingcartState {
  @override
  List<Object?> get props => [];
}

class SavedShoppingcartState extends NavShoppingcartState {
  @override
  List<Object?> get props => [];
}

class OpenProductFinderState extends NavShoppingcartState {
  @override
  List<Object?> get props => [];
}

class CancelProductFinderState extends NavShoppingcartState {
  @override
  List<Object?> get props => [];
}

class OpenProductFormState extends NavShoppingcartState {
  @override
  List<Object?> get props => [];
}

class SavingProductFormState extends NavShoppingcartState {
  @override
  List<Object?> get props => [];
}

class SavedProductFormState extends NavShoppingcartState {
  @override
  List<Object?> get props => [];
}

class CancelProductFormState extends NavShoppingcartState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends NavShoppingcartState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;

  @override
  List<Object?> get props => [error];
}
