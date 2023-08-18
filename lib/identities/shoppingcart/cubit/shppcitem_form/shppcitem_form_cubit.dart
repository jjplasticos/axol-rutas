import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/shppcitem_form_model.dart';

class ShppcitemFormCubit extends Cubit<ShppcitemFormModel> {
  ShppcitemFormCubit() : super(ShppcitemFormModel.empty());

  Future<void> change(ShppcitemFormModel shppcitemForm) async {
    emit(ShppcitemFormModel.empty());
    emit(shppcitemForm);
  }
}