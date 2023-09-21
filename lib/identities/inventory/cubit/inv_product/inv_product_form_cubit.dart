import 'package:axol_rutas/identities/product/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../globals/global_widgets/global_models/textfield_model.dart';
import '../../model/inv_product_form_model.dart';

class InvProductFormCubit extends Cubit<InvProductFormModel> {
  InvProductFormCubit() : super(InvProductFormModel.empty());

  void changeCounter(String text, int position) {
    InvProductFormModel form = state;
    form.counter = TextfieldModel(text: text, position: position);
    emit(InvProductFormModel.empty());
    emit(form);
  }

  void changeIsComplete(bool isComplete, int position){
    InvProductFormModel form = state;
    form.isComplete = isComplete;
    if (isComplete == true) {
      form.counter =TextfieldModel(text: form.stock.toString(), position: position);
    }
    emit(InvProductFormModel.empty());
    emit(form);
  }

  void changeIsCheck(bool isCheck) {
    InvProductFormModel form = state;
    form.isCheck = isCheck;
    emit(InvProductFormModel.empty());
    emit(form);
  }

  void changeProduct(ProductModel product) {
    InvProductFormModel form = state;
    form.product = product;
    emit(InvProductFormModel.empty());
    emit(form);
  }

  void changeStock(double stock) {
    InvProductFormModel form = state;
    form.stock = stock;
    emit(InvProductFormModel.empty());
    emit(form);
  }
}