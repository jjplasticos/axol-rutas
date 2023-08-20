import '../../../global_models/textfield_form_model.dart';
import '../../product/model/product.dart';

class ShppcitemFormModel {
  TextfieldFormModel quantity;
  TextfieldFormModel price;
  double stock;
  ProductModel product;

  ShppcitemFormModel({
    required this.quantity,
    required this.price,
    required this.stock,
    required this.product,
  });

  static ShppcitemFormModel empty() => ShppcitemFormModel(
        quantity: TextfieldFormModel.initial(),
        price: TextfieldFormModel.initial(),
        stock: 0,
        product: ProductModel.empty(),
      );
}
