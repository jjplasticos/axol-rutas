// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/options_edit_sale/options_edit_sale_cubit.dart';
import '../../cubit/options_edit_sale/options_edit_sale_state.dart';

class OptionsEditSaleController extends StatelessWidget {
  const OptionsEditSaleController({super.key});

  @override
  Widget build(BuildContext context_) {
    return BlocListener<OptionsEditSaleCubit, OptionsEditSaleState>(
      listener: (context, state) async {
        if (state is AskDeleteState) {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Advertencia!'),
              content: const Text('¿Está segro de eliminar esta venta?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    context_
                        .read<OptionsEditSaleCubit>()
                        .delete(state.id, 1, true);
                    Navigator.pop(context);
                  },
                  child: const Text('Sí'),
                ),
                TextButton(
                  onPressed: () {
                    context_.read<OptionsEditSaleCubit>().delete('', 1, false);
                    Navigator.pop(context);
                  },
                  child: const Text('No'),
                ),
              ],
            ),
          );
        } else if (state is DeletingState) {
        } else if (state is DeletedState) {
          Navigator.pop(context);
        } else if (state is ErrorState) {
          if (kDebugMode) {
            print(state.toString());
          }
        }
      },
      bloc: context_.read<OptionsEditSaleCubit>(),
      child: Container(),
    );
  }
}
