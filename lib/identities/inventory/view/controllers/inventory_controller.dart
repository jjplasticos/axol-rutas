import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../globals/global_widgets/global_models/textfield_model.dart';
import '../../cubit/inventory_form_cubit.dart';
import '../../cubit/inventory_view/inventory_view_cubit.dart';
import '../../cubit/inventory_view/inventory_view_state.dart';
import '../../model/inventory_form_model.dart';
import '../views/inventory_view.dart';

class InventoryController extends StatelessWidget {
  final String _empty = 'Error: No se recibió estado';

  const InventoryController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InventoryViewCubit, InventoryViewState>(
      bloc: context.read<InventoryViewCubit>()
        ..initLoad(InventoryFormModel.empty()),
      listener: (context, state) {
        if (state is LoadedState) {
          if (state.isInit) {
            context.read<InventoryFormCubit>().initialDiff(state.inventory);
          }
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          // ignore: prefer_const_constructors
          return InventoryView(
            user: state.user,
            listData: const [],
            isLoading: true,
          );
        } else if (state is LoadedState) {
          return InventoryView(
            user: state.user,
            listData: state.inventory,
            isLoading: false,
          );
        } else if (state is ErrorState) {
          return Text('Error en InventoryController: ${state.toString()}');
        } else {
          return Text(_empty);
        }
      },
    );
  }
}
