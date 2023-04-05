import 'package:axol_rutas/identities/inventory/cubit/nav_shoppingcart/nav_shoppingcart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/lists_products/lists_products_cubit.dart';
import '../views/sale_form.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductsListCubit()),
        BlocProvider(create: (_) => NavShoppingcartCubit()),
      ],
      child: SaleForm(timePick: DateTime.now().toString()),
    );
  }
}
