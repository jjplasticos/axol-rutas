import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global_models/validation_form_model.dart';
import '../../../product/model/product.dart';
import '../../model/shppcitem_form_model.dart';

class ShppcitemFormCubit extends Cubit<ShppcitemFormModel> {
  ShppcitemFormCubit() : super(ShppcitemFormModel.empty());

  Future<void> changeTextfield(
      String text, int position, int elementForm) async {
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

  Future<void> changeProduct(ProductModel product) async {
    ShppcitemFormModel form = state;
    form.product = product;
    emit(ShppcitemFormModel.empty());
    emit(form);
  }

  Future<void> changeStock(double stock) async {
    ShppcitemFormModel form = state;
    form.stock = stock;
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
    double? quantNum = double.tryParse(newForm.quantity.value);
    if (newForm.quantity.value == '' || quantNum == 0) {
      newForm.quantity.validation =
          ValidationFormModel(isValid: false, errorMessage: 'Dato no valido');
    } else if (quantNum! > newForm.stock) {
      newForm.quantity.validation = ValidationFormModel(
          isValid: false, errorMessage: 'Stock insuficiente');
    } else {
      newForm.quantity.validation = ValidationFormModel.trueValid();
    }
    return newForm;
  }

  ShppcitemFormModel _validPrice(ShppcitemFormModel shppcitemForm) {
    ShppcitemFormModel newForm = shppcitemForm;
    if (newForm.price.value == '' || double.parse(newForm.price.value) == 0) {
      newForm.price.validation =
          ValidationFormModel(isValid: false, errorMessage: 'Dato no valido');
    } else {
      newForm.price.validation = ValidationFormModel.trueValid();
    }
    return newForm;
  }
}
