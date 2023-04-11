import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/shoppingcart_txt_cubit.dart';
import '../views/product_form.dart';

class ProductFormPage extends StatelessWidget {
  final String code;
  final String description;
  final String stock;
  final String weight;

  const ProductFormPage(
      {super.key,
      required this.code,
      required this.description,
      required this.stock,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TxtQuantityCubit()),
        BlocProvider(create: (_) => TxtPriceCubit()),
      ],
      child: ProductForm(
        code: code,
        description: description,
        stock: stock,
        weight: weight,
      ),
    );
  }
}
