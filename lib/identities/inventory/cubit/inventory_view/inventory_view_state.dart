import 'package:equatable/equatable.dart';

import '../../../user/model/user.dart';
import '../../model/inventory_model.dart';

abstract class InventoryViewState extends Equatable {}

class InitialState extends InventoryViewState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends InventoryViewState {
  final UserModel user;
  LoadingState({required this.user});
  @override
  List<Object?> get props => [user];
}

class LoadedState extends InventoryViewState {
  final UserModel user;
  final List<InventoryModel> inventory;
  final bool isInit;

  LoadedState({required this.user, required this.inventory, required this.isInit});

  @override
  List<Object?> get props => [user, inventory, isInit];
}

class ErrorState extends InventoryViewState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;

  @override
  List<Object?> get props => [error];
}
