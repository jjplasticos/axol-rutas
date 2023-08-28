import 'package:equatable/equatable.dart';

import '../../model/sale_report_model.dart';

abstract class SalesReportState extends Equatable {}

class InitialState extends SalesReportState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends SalesReportState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends SalesReportState {
  final List<SaleReportModel> saleReport;
  LoadedState({required this.saleReport});
  @override
  List<Object?> get props => [saleReport];
}

class ErrorState extends SalesReportState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;

  @override
  List<Object?> get props => [error];
}