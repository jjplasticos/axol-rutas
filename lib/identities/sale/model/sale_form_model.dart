import '../../../globals/global_widgets/global_models/textfield_model.dart';

class SaleFormModel {
  TextfieldModel finder;
  DateTime dateTime;

  SaleFormModel({
    required this.finder,
    required this.dateTime,
  });

  static SaleFormModel empty() => SaleFormModel(
        finder: TextfieldModel.empty(),
        dateTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
      );
}
