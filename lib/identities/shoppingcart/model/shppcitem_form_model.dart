import '../../../global_models/textfield_form_model.dart';

class ShppcitemFormModel {
  TextfieldFormModel quantity;
  TextfieldFormModel price;

  ShppcitemFormModel({required this.quantity, required this.price});

  static ShppcitemFormModel empty() => ShppcitemFormModel(
        quantity: TextfieldFormModel.initial(),
        price: TextfieldFormModel.initial(),
      );
}
