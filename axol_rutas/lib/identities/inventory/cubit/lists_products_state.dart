import 'package:equatable/equatable.dart';

abstract class ListsProductsState extends Equatable {}

class InitialState extends ListsProductsState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends ListsProductsState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends ListsProductsState {
  final List inventoryProducts;

  LoadedState({required this.inventoryProducts});

  @override
  List<Object?> get props => [inventoryProducts];
}

class ErrorState extends ListsProductsState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;
  @override
  List<Object?> get props => [error];
}
