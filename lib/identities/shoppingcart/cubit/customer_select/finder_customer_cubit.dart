import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../globals/global_widgets/global_models/textfield_model.dart';

class FinderCustomerCubit extends Cubit<TextfieldModel> {
  FinderCustomerCubit() : super(TextfieldModel.empty());

  Future<void> change(TextfieldModel textfieldModel) async {
    emit(TextfieldModel.empty());
    emit(textfieldModel);
  }
}