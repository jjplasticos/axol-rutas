// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:axol_rutas/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectProductForm extends StatefulWidget {
  const SelectProductForm(
      {super.key,
      required this.code,
      required this.description,
      required this.stock,
      required this.weight});

  final String code;
  final String description;
  final double stock;
  final double weight;

  @override
  _SelectProductFormState createState() => _SelectProductFormState();
}

class _SelectProductFormState extends State<SelectProductForm> {
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  bool textAllowed(String text) {
    bool isAllowed = false;
    if (double.tryParse(text) != null) {
      isAllowed = true;
    }
    return isAllowed;
  }

  void _showAlertDialog(String textTitle, String textContent) {
    showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            title: Text(textTitle),
            content: Text(textContent),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style: Typo.textButton,
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(190, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: ColorPalette.primary))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: const BoxDecoration(
        color: ColorPalette.primaryBackground,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.code, style: Typo.labelText1),
                  Text(widget.description, style: Typo.labelText1),
                ],
              ),
            ),
            TextFormField(
              controller: _quantityController,
              autofocus: false,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Cantidad',
                  hintStyle: Typo.hintText,
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: ColorPalette.secondaryBackground),
              style: Typo.textField1,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('\\d*\\.?\\d*'))
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: ColorPalette.secondaryBackground,
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                    child: Text(
                      '\$',
                      textAlign: TextAlign.end,
                      style: Typo.textField1,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _priceController,
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
                        FilteringTextInputFormatter.allow(
                            RegExp('\\d*\\.?\\d*'))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Existencias: ', style: Typo.labelText1),
                Text(widget.stock.toString(), style: Typo.bodyText5),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        const bool flag = false;
                        final Map result;
                        final Map<String, dynamic> value = {
                          'code': widget.code,
                          'description': widget.description,
                          'quantity': double.tryParse(_quantityController.text)
                              .toString(),
                          'price':
                              double.tryParse(_priceController.text).toString(),
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
                            _showAlertDialog(
                                'Advertencia', 'La cantidad no es valida.');
                          } else {
                            _showAlertDialog(
                                'Advertencia', 'El precio no es valido');
                          }
                        }
                      },
                      child: Text(
                        'Agregar',
                        style: Typo.textButton,
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(190, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: ColorPalette.primary),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.keyboard_return, size: 30),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(80, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: ColorPalette.secondary),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
