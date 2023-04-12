import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/model/product.dart';
import '../../cubit/lists_products/lists_products_cubit.dart';
import '../../cubit/save_products/save_products_cubit.dart';
import '../../cubit/shoppingcart_txt_cubit.dart';
import '../views/product_form.dart';

class ProductFormPage extends StatelessWidget {
  final ProductModel productModel;
  final String stock;

  const ProductFormPage(
      {super.key, required this.stock, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TxtQuantityCubit()),
        BlocProvider(create: (_) => TxtPriceCubit()),
        BlocProvider(create: (_) => SaveProductsCubit()),
        BlocProvider(create: (_) => ProductsListCubit()),
      ],
      child: ProductForm(productModel: productModel, stock: stock),
    );
  }
}
