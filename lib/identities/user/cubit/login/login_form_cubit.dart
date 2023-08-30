import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global_models/validation_form_model.dart';
import '../../model/login_form_model.dart';

class LoginFormCubit extends Cubit<LoginFormModel> {
  LoginFormCubit() : super(LoginFormModel.empty());

  Future<void> changeTextfield(
      int textfieldKey, String value, int position) async {
    LoginFormModel form = state;
    if (textfieldKey == 0) {
      form.userName.value = value;
      form.userName.position = position;
      form = _validUserName(form);
    }
    if (textfieldKey == 1) {
      form.password.value = value;
      form.password.position = position;
      form = _validPassword(form);
    }
    emit(LoginFormModel.empty());
    emit(form);
  }

  Future<void> changeFocus(int focus) async {
    LoginFormModel form = state;
    form.focus = focus;
    emit(LoginFormModel.empty());
    emit(form);
  }

  Future<void> changeVisible(bool currentObs) async {
    LoginFormModel form = state;
    if (currentObs) {
      form.obs = false;
    } else {
      form.obs = true;
    }
    emit(LoginFormModel.empty());
    emit(form);
  }

  Future<void> allValidate() async {
    LoginFormModel form = state;
    form = _validUserName(form);
    form = _validUserName(form);
    emit(LoginFormModel.empty());
    emit(form);
  }

  LoginFormModel _validUserName(LoginFormModel rcForm) {
    LoginFormModel form = rcForm;
    if (form.userName.value == '') {
      form.userName.validation =
          ValidationFormModel(isValid: false, errorMessage: 'Dato no valido');
    } else {
      form.userName.validation = ValidationFormModel.trueValid();
    }
    return form;
  }

  LoginFormModel _validPassword(LoginFormModel rcForm) {
    LoginFormModel form = rcForm;
    if (form.password.value == '') {
      form.password.validation =
          ValidationFormModel(isValid: false, errorMessage: 'Dato no valido');
    } else {
      form.password.validation = ValidationFormModel.trueValid();
    }
    return form;
  }
}
