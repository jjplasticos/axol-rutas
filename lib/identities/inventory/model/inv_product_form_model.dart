import '../../../globals/global_widgets/global_models/textfield_model.dart';
import '../../product/model/product.dart';
import '../../user/model/user.dart';

class InvProductFormModel {
  TextfieldModel counter;
  ProductModel product;
  double stock;
  bool isComplete;
  bool isCheck;
  UserModel user;

  InvProductFormModel({
    required this.counter,
    required this.isComplete,
    required this.product,
    required this.stock,
    required this.isCheck,
    required this.user,
  });

  static InvProductFormModel empty() => InvProductFormModel(
    counter: const TextfieldModel(position: 0, text: '0'), 
    isComplete: false, 
    isCheck: false,
    product: ProductModel.empty(), 
    stock: -1, 
    user: UserModel.empty(),
    );
}