import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../globals/global_widgets/global_models/textfield_model.dart';
import '../../model/sale_form_model.dart';

class SaleFormCubit extends Cubit<SaleFormModel> {
  SaleFormCubit() : super(SaleFormModel.empty());

  void changeFinder(String text, int position) {
    SaleFormModel form = state;
    form.finder = TextfieldModel(text: text, position: position);
    emit(SaleFormModel.empty());
    emit(form);
  }

  void changeTime(DateTime time) {
    SaleFormModel form = state;
    form.dateTime = time;
    emit(SaleFormModel.empty());
    emit(form);
  }
}