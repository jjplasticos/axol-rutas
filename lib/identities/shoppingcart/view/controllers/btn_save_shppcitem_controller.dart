import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/save_shppc_item/save_shppc_item_cubit.dart';
import '../../cubit/save_shppc_item/save_shppc_item_state.dart';

class BtnSaveShppcItemController extends StatelessWidget {
  const BtnSaveShppcItemController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {
        if (state is EntrySucces) {
          Navigator.pop(context);
          Navigator.pop(context, state.shoppingcart);
        } else if (state is EntryFailure) {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Advertencia!'),
              content: Text(state.errorMessage),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        } else if (state is ErrorState) {
          print(state.error);
        }
      },
      bloc: context.read<SaveShppcItemCubit>(),
      child: Container(),
    );
  }
}
