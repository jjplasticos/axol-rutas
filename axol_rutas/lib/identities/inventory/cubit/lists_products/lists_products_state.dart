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
  final List<Map<String, dynamic>> products;

  LoadedState({required this.products});

  @override
  List<Object?> get props => [products];
}

class CloseState extends ListsProductsState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends ListsProductsState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;
  @override
  List<Object?> get props => [error];
}
