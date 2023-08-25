import 'package:axol_rutas/identities/shoppingcart/cubit/shoppingcart/shppc_cubit.dart';
import 'package:axol_rutas/identities/shoppingcart/view/controllers/rc_select_controller.dart';
import 'package:axol_rutas/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/customer_select/custselc_cubit/custselec_cubit.dart';
import '../../../cubit/customer_select/finder_customer_cubit.dart';
import '../../../cubit/shoppingcart/shppc_view_cubit.dart';
import '../../../model/route_customer_model.dart';

class BtnCustomerName extends StatelessWidget {
  final String customer;
  final bool? isLoading;

  const BtnCustomerName({super.key, required this.customer, this.isLoading});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        if (isLoading == null || isLoading == false) {
          showModalBottomSheet(
            isDismissible: false,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) => MultiBlocProvider(
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
              context.read<ShppcCubit>().changeCustomer(rcModel);
              context.read<ShppcViewCubit>().load();
            }
          });
        }
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: ColorPalette.secondaryBackground,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(customer, style: Typo.bodyText1),
        const Icon(Icons.keyboard_arrow_down,
            color: ColorPalette.secondaryText),
      ]),
    );
  }
}
