import 'package:flutter/material.dart';

import '../../../../../settings/theme.dart';

class ButtonSaveProdform extends StatelessWidget {
  const ButtonSaveProdform({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        /*const bool flag = false;
        final Map result;
        final Map<String, dynamic> value = {
          'code': widget.code,
          'description': widget.description,
          'quantity': double.tryParse(_quantityController.text).toString(),
          'price': double.tryParse(_priceController.text).toString(),
          'weight': widget.weight,
        };
        result = {'isEmpty': flag, 'value': value};
        if (textAllowed(_quantityController.text) &&
            textAllowed(_priceController.text)) {
          Navigator.pop(context);
          Navigator.pop(context, result);
        } else {
          //Abrir ventana de alerta.
          if (textAllowed(_quantityController.text) == false) {
            _showAlertDialog('Advertencia', 'La cantidad no es valida.');
          } else {
            _showAlertDialog('Advertencia', 'El precio no es valido');
          }
        }*/
      },
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(190, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: ColorPalette.primary),
      child: const Text(
        'Agregar',
        style: Typo.textButton,
      ),
    );
  }
}
