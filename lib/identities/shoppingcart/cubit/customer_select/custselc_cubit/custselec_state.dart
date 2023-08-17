import 'package:equatable/equatable.dart';

import '../../../model/route_customer_model.dart';

abstract class CustselecState extends Equatable {}

class InitialState extends CustselecState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends CustselecState {
  final List<RouteCustomerModel> rcList;
  LoadingState({required this.rcList});
  @override
  List<Object?> get props => [rcList];
}

class LoadedState extends CustselecState {
  final List<RouteCustomerModel> rcList;
  LoadedState({required this.rcList});
  @override
  List<Object?> get props => [rcList];
}

class ErrorState extends CustselecState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;
  @override
  List<Object?> get props => [error];
}