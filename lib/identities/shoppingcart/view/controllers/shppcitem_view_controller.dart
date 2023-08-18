import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/model/product.dart';
import '../../cubit/shppcitem_form/shppcitem_view_cubit.dart';
import '../../cubit/shppcitem_form/shppcitem_view_state.dart';
import '../../model/shoppingcart_models.dart';
import '../views/product_form_view.dart';

class ShppcitemViewController extends StatelessWidget {
  final ProductModel product;
  final String stock;
  final List<ShoppingcartItemModel> shoppingcart;
  final int act;
  final int index;
  
  const ShppcitemViewController({super.key, required this.product, required this.stock, required this.shoppingcart, required this.act, required this.index});

  @override
  Widget build(BuildContext context) {
    const String EMPTY = 'Error: No se recibió estado.';
    return BlocBuilder<ShppcitemViewCubit, ShppcitemViewState>(
      bloc: context.read<ShppcitemViewCubit>()..load(),
      builder: (context, state) {
        if (state is LoadingState) {
          return ProductFormView(
            act: act,
            index: index,
            isLoading: true,
            product: product,
            shoppingcart: shoppingcart,
            stock: stock,
          );
        } else if (state is LoadedState) {
          return ProductFormView(
            act: act,
            index: index,
            isLoading: false,
            product: product,
            shoppingcart: shoppingcart,
            stock: stock,
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