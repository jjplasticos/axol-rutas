import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/login/login/login_cubit.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<LoginCubit>().test(0);
      },
      child: Image.asset(
        'assets/images/logoAxol2.png',
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      ),
    );
  }
}
