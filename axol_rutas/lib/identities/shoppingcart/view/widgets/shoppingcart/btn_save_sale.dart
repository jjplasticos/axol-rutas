import 'package:axol_rutas/identities/sale/model/sale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../../settings/theme.dart';
import '../../../../sale/repository/sales_repo.dart';
import '../../../cubit/shoppingcart_cubit.dart';
import '../../../cubit/shoppingcart_txt_cubit.dart';
import '../../../model/shoppingcart_models.dart';

class BtnSaveSale extends StatelessWidget {
  final String timePick;
  const BtnSaveSale({super.key, required this.timePick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: ColorPalette.primary),
      child: const Text(
        'Guardar',
        style: Typo.textButton,
      ),
      onPressed: () async {
        final ShoppingcartResultsModel shoppingcartResults =
            context.read<ShoppingcartCubit>().state;
        final String customerName = context.read<TxtCustomerNameCubit>().state;
        Position position = await Geolocator.getCurrentPosition();
        SaleModel sale = SaleModel(
            uid: const Uuid().v4(),
            location: '${position.latitude},${position.longitude}',
            products: shoppingcartResults.shoppingcart,
            client: customerName,
            time: timePick,
            totalQuantity: shoppingcartResults.totalQuantity.toString(),
            totalWeight: shoppingcartResults.totalWeight.toString(),
            totalPrice: shoppingcartResults.totalPrice.toString());
        DatabaseSales().writeSale(sale);
        Navigator.pop(context);
        /*
        Falta validar el text field del nombre del cliente.
        */

        /*********************************************************************/
      },
    );
  }
}
