import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/sale_detail/sale_detail_cubit.dart';
import '../../cubit/sale_detail/sale_detail_state.dart';
import '../../model/sale_model.dart';
import '../views/sale_details_view.dart';

class SaleDetailController extends StatelessWidget {
  //final SaleModel sale;
  const SaleDetailController({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return BlocConsumer<SaleDetailCubit, SaleDetailState>(
      bloc: context.read<SaleDetailCubit>()..load(args['sale']),
      listener: (context, state) {
        if (state is ErrorState) {
          final snackBar = SnackBar(content: Text(state.error));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return SaleDetailsView(
            sale: args['sale'], 
            //shppc: const [],
            isLoading: true,
            ); 
        } else if (state is LoadedState) {
          return SaleDetailsView(
            sale: args['sale'],
            //shppc: state.shppc,
            isLoading: false,
            );
        } else if (state is ErrorState) {
          return SaleDetailsView(
            sale: args['sale'],
            //shppc: const [],
            isLoading: false,
            );
        } else {
          return SaleDetailsView(
            sale: args['sale'],
            //shppc: const [],
            isLoading: false,
            );
        }
      },
    );
  }
}