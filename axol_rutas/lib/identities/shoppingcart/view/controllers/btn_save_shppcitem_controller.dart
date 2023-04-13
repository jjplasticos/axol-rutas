import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/save_shppc_item/save_shppc_item_cubit.dart';

class LoginController extends StatelessWidget {
  const LoginController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {},
      bloc: context.read<SaveShppcItemCubit>(),
      child: const Text(''), //Aquí va el widget del botón.
    );
  }
}
