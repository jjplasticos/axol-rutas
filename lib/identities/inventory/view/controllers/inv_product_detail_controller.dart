import 'package:axol_rutas/identities/inventory/model/inventory_diff_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user/model/user.dart';
import '../../cubit/inv_product/inv_product_form_cubit.dart';
import '../../cubit/inv_product/inv_product_view_cubit.dart';
import '../../cubit/inv_product/inv_product_view_state.dart';
import '../views/inv_product_detail_view.dart';

class InvProductDtailController extends StatelessWidget {
  final String _empty = 'Error: No se recibió estado';

  //final ProductModel product;
  //final double stock;
  final List<InventoryDiffModel> diffList;
  final int index;

  const InvProductDtailController(
      {super.key, required this.diffList, required this.index});

  @override
  Widget build(BuildContext context) {
    final InventoryDiffModel diff = diffList.elementAt(index);
    final bool isComplete;
    if (diff.stock == diff.actualStock) {
      isComplete = true;
    } else  {
      isComplete = false;
    }
    context
        .read<InvProductFormCubit>()
        .changeProduct(diff.product);
    context
        .read<InvProductFormCubit>()
        .changeStock(diff.stock);
    context
        .read<InvProductFormCubit>()
        .changeCounter(diff.actualStock.toString(), 0);
    context
        .read<InvProductFormCubit>()
        .changeIsComplete(isComplete, 0);
    return BlocBuilder<InvProductViewCubit, InvProductViewState>(
      bloc: context.read<InvProductViewCubit>()..load(),
      builder: (context, state) {
        if (state is LoadingState) {
          // ignore: prefer_const_constructors
          return InvProductDetailView(
            user: UserModel.empty(),
            isLoading: true,
            diffList: diffList,
            index: index,
          );
        } else if (state is LoadedState) {
          // ignore: prefer_const_constructors
          return InvProductDetailView(
            user: state.user,
            isLoading: false,
            diffList: diffList,
            index: index,
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
