import 'package:flutter_bloc/flutter_bloc.dart';

class FinderTxtCubit extends Cubit<String> {
  FinderTxtCubit() : super('');

  void change(String text) {
    emit(text);
  }

  void clear() {
    emit('');
  }
}

