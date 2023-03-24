import 'package:axol_rutas/identities/user/cubit/login/controllers/password_visibility/password_visibility_cubit.dart';
import 'package:axol_rutas/identities/user/cubit/login/controllers/password_visibility/password_visibility_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordVisibilityController extends StatelessWidget {
  const PasswordVisibilityController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityState>(
      bloc: BlocProvider.of<PasswordVisibilityCubit>(context)..visibility(),
      builder: (context, state) {
        if (state is PVIsVisibleState) {
          return const Icon(Icons.visibility);
        } else if (state is PVIsNotVisibleState) {
          return const Icon(Icons.visibility_off);
        } else {
          return const Icon(Icons.visibility_off);
        }
      },
    );
  }
}
