import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../globals/global_widgets/global_models/textfield_model.dart';
import '../model/inventory_form_model.dart';

class InventoryFormCubit extends Cubit<InventoryFormModel> {
  InventoryFormCubit() : super(InventoryFormModel.empty());

  void changeFinder(String text, int position) {
    InventoryFormModel form = state;
    form.finder = TextfieldModel(text: text, position: position);
    emit(InventoryFormModel.empty());
    emit(form);
  }
}