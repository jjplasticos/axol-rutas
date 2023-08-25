import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/listview_inventory/listview_inventory_cubit.dart';
import '../../cubit/listview_inventory/listview_inventory_state.dart';
import '../widgets/listview_inventory.dart';

class ListviewInventoryController extends StatelessWidget {
  final String EMPTY = 'Error: No se recibió estado';

  const ListviewInventoryController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListviewInventoryCubit, ListviewInventoryState>(
      bloc: context.read<ListviewInventoryCubit>()..loadInventory(),
      builder: (context, state) {
        if (state is LoadingState) {
          return const Column(
            children: [
              LinearProgressIndicator(),
              Expanded(child: ListviewInventory(listData: [])),
            ],
          );
        } else if (state is LoadedState) {
          return ListviewInventory(listData: state.inventory);
          //return ListViewSales(listData: state.salesList);
        } else if (state is ErrorState) {
          return Text(
              'Error en ListviewInventoryController: ${state.toString()}');
        } else {
          return Text(EMPTY);
        }
      },
    );
  }
}
