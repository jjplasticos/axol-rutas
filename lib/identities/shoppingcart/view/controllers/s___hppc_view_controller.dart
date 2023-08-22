// ignore_for_file: prefer_const_constructors

/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settings/theme.dart';
import '../../cubit/shoppingcart_view_cubit/shoppingcart_view_cubit.dart';
import '../../cubit/shoppingcart_view_cubit/shoppingcart_view_state.dart';
import '../views/shoppingcart_view.dart';

class ShppcViewController extends StatelessWidget {
  const ShppcViewController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingcartViewCubit, ShoppingcartViewState>(
        bloc: context.read<ShoppingcartViewCubit>()..load('Sleccione un cliente'),
        builder: (context, state) {
          if (state is LoadingState) {
            return ShoppingCartView(isLoading: true,);
          } else if (state is LoadedState) {
            return ShoppingCartView(isLoading: false,);
          } else if (state is ErrorState) {
            return Text(state.error, style: Typo.labelText1,);
          } else {
            return const Text('No accedio a algun estado', style: Typo.labelText1,);
          }
        });
  }
}*/