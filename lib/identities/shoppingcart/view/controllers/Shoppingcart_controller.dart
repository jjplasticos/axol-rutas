// ignore_for_file: file_names, prefer_const_constructors

import 'package:axol_rutas/identities/shoppingcart/view/views/shoppingcart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/shoppingcart/shppc_view_cubit.dart';
import '../../cubit/shoppingcart/shppc_view_state.dart';

class ShoppingcartController extends StatelessWidget {
  const ShoppingcartController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShppcViewCubit, ShppcViewState>(
      bloc: context.read<ShppcViewCubit>()..load(),
      listener: (context, state) {
        if (state is ErrorState) {
          final snackBar = SnackBar(content: Text(state.error));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return ShoppingCartView(isLoading: true,);
        } else if (state is LoadedState) {
          return ShoppingCartView(isLoading: false);
        } else if (state is ErrorState) {
          return ShoppingCartView(isLoading: false);
        } else {
          return Text('Sin estado', style: TextStyle(color: Colors.red));
        }
      },
      );
    /*BlocListener(
      listener: (context, state) {
        if (state is EntrySucces) {
          //Navigator.pop(context);
          Navigator.of(context).pop();
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
    );*/
  }
}