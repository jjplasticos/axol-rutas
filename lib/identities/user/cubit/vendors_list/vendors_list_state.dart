import 'package:equatable/equatable.dart';

import '../../model/user.dart';

abstract class VendorsListState extends Equatable {
  const VendorsListState();
}

class InitialState extends VendorsListState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends VendorsListState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends VendorsListState {
  final List<UserModel> vendors;
  const LoadedState({required this.vendors});
  @override
  List<Object?> get props => [
        vendors,
      ];
}

class NextView extends VendorsListState {
  final bool status;
  const NextView({required this.status});
  @override
  List<Object?> get props => [status];
}

class ErrorState extends VendorsListState {
  final String error;

  const ErrorState({required this.error});

  @override
  String toString() => 'Error: $error';

  @override
  List<Object?> get props => [error];
}
