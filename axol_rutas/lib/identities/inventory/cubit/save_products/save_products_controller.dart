import 'package:axol_rutas/identities/product/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'save_products_cubit.dart';
import 'save_products_state.dart';

class ProductsFinderController extends StatelessWidget {
  final ProductModel productModel;
  final String quantity;
  final String weight;
  final String price;
  const ProductsFinderController(
      {super.key,
      required this.productModel,
      required this.quantity,
      required this.weight,
      required this.price});

  @override
  Widget build(BuildContext context) {
    const String EMPTY = 'Error: No se recibió estado.';
    return BlocBuilder<SaveProductsCubit, SaveProductsState>(
      bloc: BlocProvider.of<SaveProductsCubit>(context)
        ..save(productModel, quantity, price, weight),
      builder: (BuildContext context, SaveProductsState state) {
        if (state is SavingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SavedState) {
          return const Text('');
        } else if (state is ErrorState) {
          return Text(state.toString());
        } else {
          return const Text(EMPTY);
        }
      },
    );
  }
}
