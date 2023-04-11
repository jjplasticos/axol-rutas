import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/lists_products/lists_products_cubit.dart';
import '../../cubit/shoppingcart_txt_cubit.dart';
import '../views/product_finder.dart';

class ProdctFinderPage extends StatelessWidget {
  const ProdctFinderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductsListCubit()),
        BlocProvider(create: (_) => FinderTxtCubit()),
      ],
      child: const ProductFinder(),
    );
  }
}
