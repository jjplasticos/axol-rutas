import 'package:flutter/material.dart';

import '../../../../../../settings/theme.dart';

class BtnSaveSale extends StatelessWidget {
  const BtnSaveSale({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: ColorPalette.primary),
      child: const Text(
        'Guardar',
        style: Typo.textButton,
      ),
      onPressed: () async {
        /*final pref = await SharedPreferences.getInstance();
        pref.setString('prueba', 'hola mundo');
        pref.remove('prueba');
        final varLocalPrueba = pref.getString('prueba');
        print(varLocalPrueba);*/

        /*await supabase.from('sales').insert({
                    'client_name': _clientController.text,
                    'vendor': widget.vendor,
                    //'time': widget.timePick,
                    'total_price':
                        double.tryParse(operatorList(shoppingCart, 'price')),
                    'total_weight':
                        double.tryParse(operatorList(shoppingCart, 'weight')),
                    'total_quantity':
                        double.tryParse(operatorList(shoppingCart, 'quantity'))
                  });
                  //Cambiar este bloque de codigo por lo necesario para restar
                  //las cantidades de acuerdo al usuario conectado.
                  await supabase
                      .from('inventory')
                      .update({'stock': 20})
                      .eq('code', 'B5067')
                      .eq('vendor', 'Daniel2');
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SalesView()));
                */
      },
    );
  }
}
