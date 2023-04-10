import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../settings/theme.dart';

class TextFieldPrice extends StatelessWidget {
  const TextFieldPrice({super.key});

  @override
  Widget build(BuildContext context) {
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
              //controller: _priceController,
              autofocus: false,
              textCapitalization: TextCapitalization.none,
              obscureText: false,
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
