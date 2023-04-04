import 'package:axol_rutas/identities/sale/bloc/saleslist_cubit.dart';
import 'package:axol_rutas/identities/sale/bloc/saleslist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/widgets/sales_widget/listview_sales.dart';

class SaleController extends StatelessWidget {
  final String emptyState = 'Error: No se recibió estado';

  const SaleController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesListCubit, SalesListState>(
      builder: (BuildContext context, SalesListState state) {
        if (state is SListLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SListLoadedState) {
          return ListViewSales(listData: state.salesList);
        } else if (state is SListErrorState) {
          return Text(state.toString());
        } else {
          return Text(emptyState);
        }
      },
      bloc: BlocProvider.of<SalesListCubit>(context)..getSalesList(),
    );
  }
}
