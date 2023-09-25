// ignore_for_file: file_names, prefer_const_constructors

import 'package:axol_rutas/identities/shoppingcart/cubit/shoppingcart/shppc_cubit.dart';
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
      bloc: context.read<ShppcViewCubit>()..initLoad(),
      listener: (context, state) {
        if (state is PreLoadState) {
          String typeText = '';
          for (var element in state.saleTypeList) {
            if (element.type
                .toUpperCase()
                .contains(state.user.name.toUpperCase())) {
              typeText = element.type;
            }
          }
          context.read<ShppcCubit>().changeSaleTypeList(state.saleTypeList);
          context.read<ShppcCubit>().changeSaleType(typeText);
        }
        if (state is ErrorState) {
          final snackBar = SnackBar(content: Text(state.error));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is LoadedState) {
          if (state.isSaved == true) {
            Navigator.pop(context);
          }
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return ShoppingCartView(
            isLoading: true,
          );
        } else if (state is LoadedState) {
          return ShoppingCartView(isLoading: false);
        } else if (state is ErrorState) {
          return ShoppingCartView(isLoading: false);
        } else {
          return Text('Sin estado', style: TextStyle(color: Colors.red));
        }
      },
    );
  }
}
