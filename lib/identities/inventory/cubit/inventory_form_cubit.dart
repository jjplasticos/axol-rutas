import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../globals/global_widgets/global_models/textfield_model.dart';
import '../model/inventory_diff_model.dart';
import '../model/inventory_form_model.dart';
import '../model/inventory_model.dart';

class InventoryFormCubit extends Cubit<InventoryFormModel> {
  InventoryFormCubit() : super(InventoryFormModel.empty());

  void changeFinder(String text, int position) {
    InventoryFormModel form = state;
    form.finder = TextfieldModel(text: text, position: position);
    emit(InventoryFormModel.empty());
    emit(form);
  }

  void initialDiff(List<InventoryModel> inventoryList){
    InventoryFormModel form = state;
    List<InventoryDiffModel> diffList = [];
    InventoryDiffModel invDiff;
    for (var element in inventoryList) {
      invDiff = InventoryDiffModel(
        product: element.product, 
        stock: double.parse(element.stock), 
        actualStock: 0,
        isCheck: false,
        );
      diffList.add(invDiff);
    }
    form.diffList = diffList;
    emit(InventoryFormModel.empty());
    emit(form);
  }

  void changeDiff(List<InventoryDiffModel> diffList){
    InventoryFormModel form = state;
    form.diffList = diffList;
    emit(InventoryFormModel.empty());
    emit(form);
  }
}