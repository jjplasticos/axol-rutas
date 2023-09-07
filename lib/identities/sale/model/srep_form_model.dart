import 'package:axol_rutas/globals/global_widgets/global_models/textfield_model.dart';

class SRepFormModel {
  TextfieldModel finder;
  bool isTime;
  DateTime time;

  SRepFormModel({
    required this.finder,
    required this.isTime,
    required this.time,
  });

  static SRepFormModel empty() => SRepFormModel(
    finder: TextfieldModel.initial(), 
    isTime: true, 
    time: DateTime.now(),
    );
}
