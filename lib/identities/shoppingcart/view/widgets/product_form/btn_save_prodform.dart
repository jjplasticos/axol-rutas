import 'package:axol_rutas/globals/global_models/textfield_form_model.dart';
import 'package:axol_rutas/identities/product/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/theme.dart';
import '../../../cubit/shppcitem_form/shppcitem_form_cubit.dart';
import '../../../cubit/shppcitem_form/shppcitem_view_cubit.dart';
import '../../../model/shoppingcart_models.dart';

class ButtonSaveProdform extends StatelessWidget {
  final List<ShoppingcartItemModel> shoppingcart;
  final int act;
  final int index;

  const ButtonSaveProdform(
      {super.key,
      required this.shoppingcart,
      required this.act,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final TextfieldFormModel quantityForm =
        context.read<ShppcitemFormCubit>().state.quantity;
    final TextfieldFormModel priceForm =
        context.read<ShppcitemFormCubit>().state.price;
    final ProductModel productForm =
        context.read<ShppcitemFormCubit>().state.product;
    return ElevatedButton(
      onPressed: () async {
        context.read<ShppcitemFormCubit>().allValidate();
        if (quantityForm.validation.isValid == true &&
            priceForm.validation.isValid == true) {
          if (act == 0) {
            shoppingcart.add(ShoppingcartItemModel(
              price: double.parse(priceForm.value),
              quantity: double.parse(quantityForm.value),
              product: productForm,
            ));
          } else if (act == 1) {
            shoppingcart.removeAt(index);
            shoppingcart.insert(
                index,
                ShoppingcartItemModel(
                  price: double.parse(priceForm.value),
                  quantity: double.parse(quantityForm.value),
                  product: productForm,
                ));
          }
          Navigator.pop(context);
          Navigator.pop(context, shoppingcart);
        } else {
          context.read<ShppcitemViewCubit>().load();
        }
      },
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(190, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: ColorPalette.primary),
      child: const Text(
        'Agregar',
        style: Typo.textButton,
      ),
    );
  }
}
