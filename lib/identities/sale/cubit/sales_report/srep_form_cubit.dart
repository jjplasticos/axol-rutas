import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global_widgets/global_models/textfield_model.dart';
import '../../model/srep_form_model.dart';

class SRepFormCubit extends Cubit<SRepFormModel> {
  SRepFormCubit() : super(SRepFormModel.empty());

  void changeFinder(String text, int position) {
    SRepFormModel form = state;
    form.finder = TextfieldModel(text: text, position: position);
    emit(SRepFormModel.empty());
    emit(form);
  }

  void changeTime(DateTime time) {
    SRepFormModel form = state;
    form.time = time;
    emit(SRepFormModel.empty());
    emit(form);
  }

  void changeIsTime(bool isTime) {
    SRepFormModel form = state;
    form.isTime = isTime;
    emit(SRepFormModel.empty());
    emit(form);
  }
}