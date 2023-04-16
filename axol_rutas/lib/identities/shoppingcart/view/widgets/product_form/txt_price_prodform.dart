import 'package:axol_rutas/identities/shoppingcart/cubit/shoppingcart_txt_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/theme.dart';

class TextFieldPrice extends StatelessWidget {
  final String initialPrice;
  const TextFieldPrice({super.key, required this.initialPrice});

  @override
  Widget build(BuildContext context) {
    context.read<TxtPriceCubit>().change(initialPrice);
    return Container(
      decoration: BoxDecoration(
          color: ColorPalette.secondaryBackground,
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
            child: Text(
              '\$',
              textAlign: TextAlign.end,
              style: Typo.textField1,
            ),
          ),
          Expanded(
            child: TextFormField(
              initialValue: initialPrice,
              autofocus: false,
              textCapitalization: TextCapitalization.none,
              obscureText: false,
              onChanged: (value) {
                context.read<TxtPriceCubit>().change(value);
              },
              decoration: InputDecoration(
                  hintText: 'Precio',
                  hintStyle: Typo.hintText,
                  enabledBorder: const UnderlineInputBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  filled: true,
                  fillColor: ColorPalette.secondaryBackground),
              style: Typo.textField1,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('\\d*\\.?\\d*'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
