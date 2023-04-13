import 'package:equatable/equatable.dart';

abstract class SaveShppcItemState extends Equatable {}

class InitialState extends SaveShppcItemState {
  @override
  List<Object?> get props => [];
}

class EntryFailure extends SaveShppcItemState {
  final String errorMessage;

  EntryFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class EntrySucces extends SaveShppcItemState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends SaveShppcItemState {
  final String error;

  ErrorState({required this.error});

  @override
  String toString() => error;
  @override
  List<Object?> get props => [error];
}
