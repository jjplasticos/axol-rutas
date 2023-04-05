import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'nav_shoppingcart_cubit.dart';
import 'nav_shoppingcart_state.dart';

class BtnShoppingcartController extends StatelessWidget {
  const BtnShoppingcartController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {
        if (state is OpenProductFinderState) {
          showModalBottomSheet(
            isDismissible: false,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: const Text('Product Finder Bottonsheet'),
              );
            },
          );
        } else if (state is ErrorState) {
          if (kDebugMode) {
            print('LoginErrorState: ${state.error}');
          }
        }
      },
      bloc: context.read<NavShoppingcartCubit>(),
      child: const Text(''),
    );
  }
}

class BtnCancelProductFinderController extends StatelessWidget {
  const BtnCancelProductFinderController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {
        if (state is OpenProductFinderState) {
          showModalBottomSheet(
            isDismissible: false,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: const Text('Product Finder Bottonsheet'),
              );
            },
          );
        } else if (state is ErrorState) {
          if (kDebugMode) {
            print('LoginErrorState: ${state.error}');
          }
        }
      },
      bloc: context.read<NavShoppingcartCubit>(),
      child: const Text(''),
    );
  }
}
