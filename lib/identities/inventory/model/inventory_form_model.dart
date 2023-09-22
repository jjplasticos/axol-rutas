import 'package:axol_rutas/identities/inventory/model/inventory_diff_model.dart';

import '../../../globals/global_widgets/global_models/textfield_model.dart';

class InventoryFormModel {
  TextfieldModel finder;
  List<InventoryDiffModel> diffList;


  InventoryFormModel({required this.finder, required this.diffList});

  static InventoryFormModel empty() => InventoryFormModel(
    finder: TextfieldModel.empty(),
    diffList: [],
    );
}