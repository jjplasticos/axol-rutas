import 'package:equatable/equatable.dart';

import '../../../user/model/user.dart';

abstract class InvProductViewState extends Equatable {}

class InitialState extends InvProductViewState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends InvProductViewState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends InvProductViewState {
  final UserModel user;
  LoadedState({required this.user});
  @override
  List<Object?> get props => [user];
}

class ErrorState extends InvProductViewState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;

  @override
  List<Object?> get props => [error];
}