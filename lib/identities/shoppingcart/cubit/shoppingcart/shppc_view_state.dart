import 'package:equatable/equatable.dart';

import '../../../sale/model/sale_type_model.dart';
import '../../../user/model/user.dart';

abstract class ShppcViewState extends Equatable {}

class InitialState extends ShppcViewState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends ShppcViewState {
  @override
  List<Object?> get props => [];
}

class PreLoadState extends ShppcViewState {
  final List<SaleTypeModel> saleTypeList;
  final UserModel user;
  PreLoadState({required this.saleTypeList, required this.user});
  @override
  List<Object?> get props => [saleTypeList, user];
}

class LoadedState extends ShppcViewState {
  final bool isSaved;
  LoadedState({required this.isSaved});
  @override
  List<Object?> get props => [isSaved];
}

class ErrorState extends ShppcViewState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;
  @override
  List<Object?> get props => [error];
}