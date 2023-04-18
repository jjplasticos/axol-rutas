import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../settings/theme.dart';
import '../../../cubit/shoppingcart_txt_cubit.dart';

class TxtCustomerName extends StatelessWidget {
  const TxtCustomerName({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        context.read<TxtCustomerNameCubit>().change(value);
      },
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Nombre del cliente',
        hintStyle: Typo.hintText,
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: ColorPalette.secondaryBackground,
      ),
    );
  }
}
