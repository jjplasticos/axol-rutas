import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global_models/validation_form_model.dart';
import '../../model/addcustomer_form_model.dart';

class CustomerFormCubit extends Cubit<AddcustomerFormModel> {
  CustomerFormCubit() : super(AddcustomerFormModel.empty());

  Future<void> changeTextfield(int textfieldKey, String value, int position) async {
    AddcustomerFormModel form = state;
    if (textfieldKey ==  0) {
      form.name.value = value;
      form.name.position = position;
      form = _validName(form);
    }
    if (textfieldKey ==  1) {
      form.address.value = value;
      form.address.position = position;
      form = _validAddress(form);
    }
    if (textfieldKey ==  2) {
      form.hood.value = value;
      form.hood.position = position;
      form = _validHood(form);
    }
    if (textfieldKey ==  3) {
      form.town.value = value;
      form.town.position = position;
      form = _validTown(form);
    }
    if (textfieldKey ==  4) {
      form.country.value = value;
      form.country.position = position;
      form = _validCountry(form);
    }
    emit(AddcustomerFormModel.empty());
    emit(form);
  }

  Future<void> changeVendor(String vendor) async {
    AddcustomerFormModel form = state;
    form.vendor = vendor;
  }  

  AddcustomerFormModel _validName(AddcustomerFormModel rcForm) {
    AddcustomerFormModel form = rcForm;
    if (form.name.value == '') {
      form.name.validation =
          ValidationFormModel(isValid: false, errorMessage: 'Dato no valido');
    } else {
      form.name.validation = ValidationFormModel.trueValid();
    }
    return form;
  }
  
  AddcustomerFormModel _validAddress(AddcustomerFormModel rcForm) {
    AddcustomerFormModel form = rcForm;
    if (form.address.value == '') {
      form.address.validation =
          ValidationFormModel(isValid: false, errorMessage: 'Dato no valido');
    } else {
      form.address.validation = ValidationFormModel.trueValid();
    }
    return form;
  }

  AddcustomerFormModel _validHood(AddcustomerFormModel rcForm) {
    AddcustomerFormModel form = rcForm;
    if (form.hood.value == '') {
      form.hood.validation =
          ValidationFormModel(isValid: false, errorMessage: 'Dato no valido');
    } else {
      form.hood.validation = ValidationFormModel.trueValid();
    }
    return form;
  }
  
  AddcustomerFormModel _validTown(AddcustomerFormModel rcForm) {
    AddcustomerFormModel form = rcForm;
    if (form.town.value == '') {
      form.town.validation =
          ValidationFormModel(isValid: false, errorMessage: 'Dato no valido');
    } else {
      form.town.validation = ValidationFormModel.trueValid();
    }
    return form;
  }

  AddcustomerFormModel _validCountry(AddcustomerFormModel rcForm) {
    AddcustomerFormModel form = rcForm;
    if (form.country.value == '') {
      form.town.validation =
          ValidationFormModel(isValid: false, errorMessage: 'Dato no valido');
    } else {
      form.town.validation = ValidationFormModel.trueValid();
    }
    return form;
  }
}