import 'package:equatable/equatable.dart';

abstract class OptionsShppcItemState extends Equatable {}

class InitialState extends OptionsShppcItemState {
  @override
  List<Object?> get props => [];
}

class EditState extends OptionsShppcItemState {
  @override
  List<Object?> get props => [];
}

class DeleteState extends OptionsShppcItemState {
  @override
  List<Object?> get props => [];
}

class CancelState extends OptionsShppcItemState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends OptionsShppcItemState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;
  @override
  List<Object?> get props => [error];
}
