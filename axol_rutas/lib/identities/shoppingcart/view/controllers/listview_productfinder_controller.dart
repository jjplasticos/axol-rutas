// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/product_finder/product_finder_cubit.dart';
import '../../cubit/product_finder/product_finder_state.dart';
import '../../model/shoppingcart_models.dart';
import '../../view/widgets/product_finder/listview_product_finder.dart';

class ListviewProductFinderController extends StatelessWidget {
  final String filter;
  final List<ShoppingcartItemModel> shoppingcart;

  const ListviewProductFinderController(
      {super.key, required this.filter, required this.shoppingcart});

  @override
  Widget build(BuildContext context) {
    const String EMPTY = 'Error: No se recibió estado.';
    return BlocBuilder<ProductFinderCubit, ProductFinderState>(
      bloc: BlocProvider.of<ProductFinderCubit>(context)
        ..productsInventory(filter),
      builder: (BuildContext context, ProductFinderState state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadedState) {
          return ListviewProductFinder(
            products: state.products,
            shoppingcart: shoppingcart,
          );
        } else if (state is ErrorState) {
          return Text(state.toString());
        } else {
          return const Text(EMPTY);
        }
      },
    );
  }
}
