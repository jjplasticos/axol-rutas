import 'package:equatable/equatable.dart';

abstract class ShppcViewState extends Equatable {}

class InitialState extends ShppcViewState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends ShppcViewState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends ShppcViewState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends ShppcViewState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;
  @override
  List<Object?> get props => [error];
}