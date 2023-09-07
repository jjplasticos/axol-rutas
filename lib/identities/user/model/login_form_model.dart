import '../../../globals/global_models/textfield_form_model.dart';

class LoginFormModel {
  TextfieldFormModel userName;
  TextfieldFormModel password;
  bool obs;
  int focus;

  LoginFormModel({
    required this.userName,
    required this.password,
    required this.focus,
    required this.obs
  });

  static LoginFormModel empty() => LoginFormModel(
        userName: TextfieldFormModel.initial(),
        password: TextfieldFormModel.initial(),
        obs: true,
        focus: -1,
      );
}