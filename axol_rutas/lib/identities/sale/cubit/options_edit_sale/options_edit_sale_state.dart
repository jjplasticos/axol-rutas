import 'package:equatable/equatable.dart';

abstract class OptionsEditSaleState extends Equatable {}

class InitialState extends OptionsEditSaleState {
  @override
  List<Object?> get props => [];
}

class AskDeleteState extends OptionsEditSaleState {
  final String id;
  AskDeleteState({required this.id});
  @override
  List<Object?> get props => [id];
}

class ConfirmDeleteState extends OptionsEditSaleState {
  final bool confirm;
  ConfirmDeleteState({required this.confirm});
  @override
  List<Object?> get props => [confirm];
}

class DeletingState extends OptionsEditSaleState {
  @override
  List<Object?> get props => [];
}

class DeletedState extends OptionsEditSaleState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends OptionsEditSaleState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;

  @override
  List<Object?> get props => [error];
}
