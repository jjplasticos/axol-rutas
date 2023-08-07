import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global_widgets/global_models/textfield_model.dart';

class FinderCustomerCubit extends Cubit<TextfieldModel> {
  FinderCustomerCubit() : super(TextfieldModel.initial());

  Future<void> change(TextfieldModel textfieldModel) async {
    emit(TextfieldModel.initial());
    emit(textfieldModel);
  }
}