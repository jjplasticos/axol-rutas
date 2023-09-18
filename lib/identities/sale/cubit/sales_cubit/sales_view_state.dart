import 'package:equatable/equatable.dart';

import '../../../user/model/user.dart';

abstract class SalesViewState extends Equatable {}

class InitialState extends SalesViewState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends SalesViewState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends SalesViewState {
  final UserModel vendor;

  LoadedState({required this.vendor});

  @override
  List<Object?> get props => [vendor];
}

class ErrorState extends SalesViewState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;

  @override
  List<Object?> get props => [error];
}