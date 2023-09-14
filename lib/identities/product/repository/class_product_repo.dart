import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/class_product_model.dart';

class ClassProductRepo {
  final String _table = 'class_product';
  final String _id = 'id';
  final String _text1 = 'text1';
  final _supabase = Supabase.instance.client;

  Future<List<ClassProductModel>> getClassList() async {
    List<Map<String, dynamic>> classListDB = [];
    List<ClassProductModel> classList = [];
    ClassProductModel classProduct;
    classListDB =
        await _supabase.from(_table).select<List<Map<String, dynamic>>>();
    if (classListDB.isNotEmpty) {
      for (var element in classListDB) {
        classProduct = ClassProductModel(
          id: element[_id],
          text1: element[_text1],
        );
        classList.add(classProduct);
      }
    }

    return classList;
  }
}
