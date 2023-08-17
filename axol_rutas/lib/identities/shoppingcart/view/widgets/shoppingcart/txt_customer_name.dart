import 'package:axol_rutas/identities/shoppingcart/view/controllers/rc_select_controller.dart';
import 'package:axol_rutas/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/customer_select/custselc_cubit/custselec_cubit.dart';
import '../../../cubit/customer_select/finder_customer_cubit.dart';
import '../../../cubit/shoppingcart_txt_cubit.dart';
import '../../../cubit/shoppingcart_view_cubit/shoppingcart_view_cubit.dart';
import '../../../model/route_customer_model.dart';

class BtnCustomerName extends StatelessWidget {
  final String customer;

  const BtnCustomerName({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){
        showModalBottomSheet(
          isDismissible: false,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder:(context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => CustselecCubit()),
              BlocProvider(create: (_) => FinderCustomerCubit()),
            ], 
            child: const RcSelectController(),
          ), 
        ).then((value) {
          final RouteCustomerModel rcModel;
          if (value != null) {
            rcModel = value;
            context.read<ShoppingcartViewCubit>().load(rcModel.name);
            context.read<TxtCustomerNameCubit>().change(rcModel.name);
          }
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: ColorPalette.secondaryBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(customer, style: Typo.bodyText1),
        const Icon(Icons.keyboard_arrow_down, color: ColorPalette.secondaryText),
      ]),
    );
    /*TextFormField(
      onChanged: (value) {
        context.read<TxtCustomerNameCubit>().change(value);
      },
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Nombre del cliente',
        hintStyle: Typo.hintText,
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: ColorPalette.secondaryBackground,
      ),
    );*/
  }
}
