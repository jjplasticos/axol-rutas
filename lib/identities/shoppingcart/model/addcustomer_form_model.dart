import '../../../global_models/textfield_form_model.dart';

class AddcustomerFormModel {
  TextfieldFormModel name;
  TextfieldFormModel address;
  TextfieldFormModel hood;
  TextfieldFormModel town;
  TextfieldFormModel country;
  String vendor;
  int focus;

  AddcustomerFormModel({
    required this.address,
    required this.country,
    required this.hood,
    required this.name,
    required this.town,
    required this.vendor,
    required this.focus,
  });

  static AddcustomerFormModel empty() => AddcustomerFormModel(
        address: TextfieldFormModel.initial(),
        country: TextfieldFormModel.initial(),
        hood: TextfieldFormModel.initial(),
        name: TextfieldFormModel.initial(),
        town: TextfieldFormModel.initial(),
        vendor: '',
        focus: -1,
      );
}
