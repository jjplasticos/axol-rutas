import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/model/product.dart';
import '../../../user/model/user.dart';
import '../../cubit/inv_product/inv_product_form_cubit.dart';
import '../../cubit/inv_product/inv_product_view_cubit.dart';
import '../../cubit/inv_product/inv_product_view_state.dart';
import '../views/inv_product_detail_view.dart';

class InvProductDtailController extends StatelessWidget {
  final String _empty = 'Error: No se recibió estado';

  final ProductModel product;
  final double stock;

  const InvProductDtailController(
      {super.key, required this.product, required this.stock});

  @override
  Widget build(BuildContext context) {
    context.read<InvProductFormCubit>().changeProduct(product);
    context.read<InvProductFormCubit>().changeStock(stock);
    return BlocBuilder<InvProductViewCubit, InvProductViewState>(
      bloc: context.read<InvProductViewCubit>()..load(),
      builder: (context, state) {
        if (state is LoadingState) {
          // ignore: prefer_const_constructors
          return InvProductDetailView(
            user: UserModel.empty(),
            isLoading: true,
          );
        } else if (state is LoadedState) {
          // ignore: prefer_const_constructors
          return InvProductDetailView(
            user: state.user,
            isLoading: false,
          );
        } else if (state is ErrorState) {
          return Text(
            'InvProductDtailController: ${state.toString()}',
            style: const TextStyle(color: Colors.red),
          );
        } else {
          return Text(_empty);
        }
      },
    );
  }
}
