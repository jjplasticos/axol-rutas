// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/widgets/sales_widget/listview_sales.dart';
import 'saleslist_cubit.dart';
import 'saleslist_state.dart';

class SaleController extends StatelessWidget {
  final String EMPTY = 'Error: No se recibió estado';

  const SaleController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesListCubit, SalesListState>(
      //bloc: BlocProvider.of<SalesListCubit>(context)..getSalesList(),
      bloc: context.read<SalesListCubit>()..getSalesList(),
      builder: (context, state) {
        if (state is SListLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SListLoadedState) {
          return ListViewSales(listData: state.salesList);
        } else if (state is SListErrorState) {
          return Text('Error en SaleController: ${state.toString()}');
        } else {
          return Text(EMPTY);
        }
      },
    );
  }
}
