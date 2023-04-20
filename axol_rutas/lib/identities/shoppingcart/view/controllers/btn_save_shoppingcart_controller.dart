import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/save_shoppingcart/save_shoppingcart_cubit.dart';
import '../../cubit/save_shoppingcart/save_shoppingcart_state.dart';

class BtnSaveShoppingcartController extends StatelessWidget {
  const BtnSaveShoppingcartController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {
        if (state is EntrySucces) {
          Navigator.pop(context);
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
          print('Error en BtnSaveShoppingcartController: ${state.error}');
        }
      },
      bloc: context.read<SaveShoppingcartCubit>(),
      child: Container(),
    );
  }
}
