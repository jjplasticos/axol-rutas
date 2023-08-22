import 'package:axol_rutas/identities/shoppingcart/model/shoppingcart_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settings/theme.dart';
import '../../cubit/options_shppc_item/options_shppcitem_cubit.dart';

class BtnOptionShppcItem extends StatelessWidget {
  final String text;
  final Color color;
  final int action;
  final int index;
  final List<ShoppingcartItemModel> shoppingcart;
  final double? stock;

  const BtnOptionShppcItem(
      {super.key,
      required this.text,
      required this.color,
      required this.action,
      required this.shoppingcart,
      required this.index, 
      this.stock});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 80),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: color),
      child: Text(
        text,
        style: Typo.textButton,
      ),
      onPressed: () async {
        switch (action) {
          case 0:
            {
              context.read<OptionsShppcItemCubit>().getStock(shoppingcart, index);
            }
            break;
          case 1:
            {
              shoppingcart.removeAt(index);
              Navigator.pop(context, shoppingcart);
            }
            break;
          case 2:
            {
              Navigator.pop(context, shoppingcart);
            }
            break;
          default:
            {}
            break;
        }
      },
    );
  }
}
