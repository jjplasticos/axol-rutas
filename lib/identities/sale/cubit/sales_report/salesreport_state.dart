import 'package:equatable/equatable.dart';

import '../../../user/model/user.dart';
import '../../model/sale_report_model.dart';

abstract class SalesReportState extends Equatable {}

class InitialState extends SalesReportState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends SalesReportState {
  final UserModel user;
  LoadingState({required this.user});
  @override
  List<Object?> get props => [user];
}

class LoadedState extends SalesReportState {
  final List<SaleReportModel> saleReport;
  final UserModel user;
  LoadedState({required this.saleReport, required this.user});
  @override
  List<Object?> get props => [saleReport, user];
}

class ErrorState extends SalesReportState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;

  @override
  List<Object?> get props => [error];
}