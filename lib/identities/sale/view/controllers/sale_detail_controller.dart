import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/sale_detail/sale_detail_cubit.dart';
import '../../cubit/sale_detail/sale_detail_state.dart';
import '../../model/sale_model.dart';
import '../views/sale_details_view.dart';

class SaleDetailController extends StatelessWidget {
  final SaleModel sale;
  const SaleDetailController({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SaleDetailCubit, SaleDetailState>(
      bloc: context.read<SaleDetailCubit>()..load(sale),
      listener: (context, state) {
        if (state is ErrorState) {
          final snackBar = SnackBar(content: Text(state.error));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return SaleDetailsView(
            sale: sale, 
            //shppc: const [],
            isLoading: true,
            ); 
        } else if (state is LoadedState) {
          return SaleDetailsView(
            sale: sale,
            //shppc: state.shppc,
            isLoading: false,
            );
        } else if (state is ErrorState) {
          return SaleDetailsView(
            sale: sale,
            //shppc: const [],
            isLoading: false,
            );
        } else {
          return SaleDetailsView(
            sale: sale,
            //shppc: const [],
            isLoading: false,
            );
        }
      },
    );
  }
}