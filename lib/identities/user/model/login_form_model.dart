import '../../../global_models/textfield_form_model.dart';

class LoginFormModel {
  TextfieldFormModel userName;
  TextfieldFormModel password;
  int focus;

  LoginFormModel({
    required this.userName,
    required this.password,
    required this.focus,
  });

  static LoginFormModel empty() => LoginFormModel(
        userName: TextfieldFormModel.initial(),
        password: TextfieldFormModel.initial(),
        focus: -1,
      );
}