import 'package:equatable/equatable.dart';

import '../../../user/model/user.dart';
import '../../model/sale_model.dart';

abstract class SalesViewState extends Equatable {}

class InitialState extends SalesViewState {
  @override
  List<Object?> get props => [];
}

class InitialFormState extends SalesViewState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends SalesViewState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends SalesViewState {
  final UserModel user;
  final List<SaleModel> salesList;
  final int nSaleNotSync;

  LoadedState({required this.user, required this.salesList, required this.nSaleNotSync});

  @override
  List<Object?> get props => [user, salesList, nSaleNotSync];
}

class ErrorState extends SalesViewState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;

  @override
  List<Object?> get props => [error];
}