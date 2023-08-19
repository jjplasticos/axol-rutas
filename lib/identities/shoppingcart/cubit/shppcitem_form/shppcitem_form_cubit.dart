import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global_models/validation_form_model.dart';
import '../../model/shppcitem_form_model.dart';

class ShppcitemFormCubit extends Cubit<ShppcitemFormModel> {
  ShppcitemFormCubit() : super(ShppcitemFormModel.empty());

  Future<void> change(String text, int position, int elementForm) async {
    ShppcitemFormModel form = state;
    if (elementForm == 0) {
      form.quantity.value = text;
      form.quantity.position = position;
      form = _validQuantity(form);
    }
    if (elementForm == 1) {
      form.price.value = text;
      form.price.position = position;
      form = _validPrice(form);
    }
    emit(ShppcitemFormModel.empty());
    emit(form);
  }

  Future<void> allValidate() async {
    ShppcitemFormModel form = state;
    form = _validQuantity(form);
    form = _validPrice(form);
    emit(ShppcitemFormModel.empty());
    emit(form);
  }

  ShppcitemFormModel _validQuantity(ShppcitemFormModel shppcitemForm) {
    ShppcitemFormModel newForm = shppcitemForm;
    if (newForm.quantity.value == '') {
      newForm.quantity.validation =
          ValidationFormModel(isValid: false, errorMessage: 'Dato no valido');
    } else {
      newForm.quantity.validation = ValidationFormModel.trueValid();
    }
    return newForm;
  }

  ShppcitemFormModel _validPrice(ShppcitemFormModel shppcitemForm) {
    ShppcitemFormModel newForm = shppcitemForm;
    if (newForm.price.value == '') {
      newForm.price.validation =
          ValidationFormModel(isValid: false, errorMessage: 'Dato no valido');
    } else {
      newForm.price.validation = ValidationFormModel.trueValid();
    }
    return newForm;
  }
}