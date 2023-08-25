import 'package:equatable/equatable.dart';

abstract class CustomerFormviewState extends Equatable {}

class InitialState extends CustomerFormviewState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends CustomerFormviewState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends CustomerFormviewState {
  final String vendor;
  LoadedState({required this.vendor});
  @override
  List
  <Object?> get props => [vendor];
}

class SavedState extends CustomerFormviewState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends CustomerFormviewState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;
  @override
  List<Object?> get props => [error];
}