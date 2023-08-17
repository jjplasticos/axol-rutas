import 'package:equatable/equatable.dart';

abstract class ShoppingcartViewState extends Equatable {}

class InitialState extends ShoppingcartViewState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends ShoppingcartViewState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends ShoppingcartViewState {
  final String customerName;
  LoadedState({required this.customerName});
  @override
  List<Object?> get props => [customerName];
}

class ErrorState extends ShoppingcartViewState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;
  @override
  List<Object?> get props => [error];
}