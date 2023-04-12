import 'package:equatable/equatable.dart';

abstract class SaveProductsState extends Equatable {}

class InitialState extends SaveProductsState {
  @override
  List<Object?> get props => [];
}

class SavingState extends SaveProductsState {
  @override
  List<Object?> get props => [];
}

class SavedState extends SaveProductsState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends SaveProductsState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;
  @override
  List<Object?> get props => [error];
}
