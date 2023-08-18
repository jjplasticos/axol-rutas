import 'package:equatable/equatable.dart';

abstract class ShppcitemViewState extends Equatable {}

class InitialState extends ShppcitemViewState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends ShppcitemViewState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends ShppcitemViewState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends ShppcitemViewState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;
  @override
  List<Object?> get props => [error];
}