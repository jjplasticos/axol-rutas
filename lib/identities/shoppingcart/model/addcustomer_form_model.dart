import '../../../globals/global_models/textfield_form_model.dart';
import '../../user/model/user.dart';

class AddcustomerFormModel {
  TextfieldFormModel name;
  TextfieldFormModel address;
  TextfieldFormModel town;
  TextfieldFormModel country;
  TextfieldFormModel sector;
  UserModel vendor;
  int focus;

  AddcustomerFormModel({
    required this.address,
    required this.country,
    required this.sector,
    required this.name,
    required this.town,
    required this.vendor,
    required this.focus,
  });

  static AddcustomerFormModel empty() => AddcustomerFormModel(
        address: TextfieldFormModel.initial(),
        country: TextfieldFormModel.initial(),
        sector: TextfieldFormModel.initial(),
        name: TextfieldFormModel.initial(),
        town: TextfieldFormModel.initial(),
        vendor: UserModel.empty(),
        focus: -1,
      );
}
