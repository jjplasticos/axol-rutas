import '../../../globals/global_widgets/global_models/textfield_model.dart';

class InventoryFormModel {
  TextfieldModel finder;

  InventoryFormModel({required this.finder});

  static InventoryFormModel empty() => InventoryFormModel(
    finder: TextfieldModel.empty(),
    );
}