import 'package:equatable/equatable.dart';

abstract class ProductFinderState extends Equatable {}

class InitialState extends ProductFinderState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends ProductFinderState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends ProductFinderState {
  final List<Map<String, dynamic>> products;

  LoadedState({required this.products});

  @override
  List<Object?> get props => [products];
}

class CloseState extends ProductFinderState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends ProductFinderState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;
  @override
  List<Object?> get props => [error];
}
