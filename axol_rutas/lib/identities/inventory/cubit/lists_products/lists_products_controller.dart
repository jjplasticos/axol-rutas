// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view/widgets/product_finder/listview_product_finder.dart';
import '../../view/widgets/sale_form/listview_shoppingcart.dart';
import 'lists_products_cubit.dart';
import 'lists_products_state.dart';

class ProductsFinderController extends StatelessWidget {
  final String filter;

  const ProductsFinderController({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    const String EMPTY = 'Error: No se recibió estado.';
    return BlocBuilder<ProductsListCubit, ListsProductsState>(
      bloc: BlocProvider.of<ProductsListCubit>(context)
        ..productsInventory(filter),
      builder: (BuildContext context, ListsProductsState state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadedState) {
          return ListviewProductFinder(products: state.products);
        } else if (state is ErrorState) {
          return Text(state.toString());
        } else {
          return const Text(EMPTY);
        }
      },
    );
  }
}

class ProductsShoppingcartController extends StatelessWidget {
  const ProductsShoppingcartController({super.key});

  @override
  Widget build(BuildContext context) {
    const String EMPTY = 'Error: No se recibió estado.';
    return BlocBuilder<ProductsListCubit, ListsProductsState>(
      bloc: BlocProvider.of<ProductsListCubit>(context)..productsShoppingCart(),
      builder: (BuildContext context, ListsProductsState state) {
        if (state is InitialState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadedState) {
          return ListviewShoppingcart(
            shoppingCart: state.products,
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
