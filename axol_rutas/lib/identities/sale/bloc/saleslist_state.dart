import 'package:axol_rutas/identities/sale/model/sale.dart';
import 'package:equatable/equatable.dart';

abstract class SalesListState extends Equatable {}

class SListInitialState extends SalesListState {
  @override
  List<Object?> get props => [];
}

class SListLoadingState extends SalesListState {
  @override
  List<Object?> get props => [];
}

class SListLoadedState extends SalesListState {
  final List<SaleModel> salesList;

  SListLoadedState({required this.salesList});

  @override
  List<Object?> get props => [salesList];
}

class SListErrorState extends SalesListState {
  final String error;

  SListErrorState({required this.error});

  @override
  String toString() => error;

  @override
  List<Object?> get props => [error];
}
