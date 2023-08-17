import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldFinderSaleCubit extends Cubit<String> {
  TextFieldFinderSaleCubit() : super('');

  void change(String text) {
    emit(text);
  }

  void clear() {
    emit('');
  }
}
