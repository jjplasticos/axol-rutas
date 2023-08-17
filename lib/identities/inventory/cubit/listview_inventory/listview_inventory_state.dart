import 'package:equatable/equatable.dart';

import '../../model/inventory.dart';

abstract class ListviewInventoryState extends Equatable {}

class InitialState extends ListviewInventoryState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends ListviewInventoryState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends ListviewInventoryState {
  final List<InventoryModel> inventory;

  LoadedState({required this.inventory});

  @override
  List<Object?> get props => [inventory];
}

class ErrorState extends ListviewInventoryState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;

  @override
  List<Object?> get props => [error];
}
