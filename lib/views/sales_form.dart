// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously

import 'package:axol_rutas/views/sales_view.dart';
import 'package:axol_rutas/settings/format.dart';
import 'package:axol_rutas/settings/jsonList.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../settings/theme.dart';
import 'package:axol_rutas/views/components/select_product.dart';

class SalesForm extends StatefulWidget {
  const SalesForm(
      {super.key,
      required this.timePick,
      required this.saleID,
      required this.vendor});

  final DateTime timePick;
  final String saleID;
  final String vendor;

  @override
  _SalesPageState createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesForm> {
  final supabase = Supabase.instance.client;
  List<Map> shoppingCart = [];

  final _clientController = TextEditingController();

  @override
  void dispose() {
    _clientController.dispose();
    super.dispose();
  }

  void _closeModal(Map result) {
    if (result['isEmpty'] == false) {
      shoppingCart.add(result['value']);
    }
  }

  String operatorList(List<Map> mapList, String type) {
    double total = 0, valueA, valueB;
    List listA = [], listB = [];
    switch (type) {
      case 'quantity':
        {
          listA = createList(mapList, type);
          for (valueA in listA) {
            total = total + valueA;
          }
        }
        break;
      case 'weight':
        {
          listA = createList(mapList, 'quantity');
          listB = createList(mapList, 'weight');
          for (int i = 0; i < listB.length; i++) {
            valueA = listA.elementAt(i);
            valueB = listB.elementAt(i);
            total = total + (valueA * valueB);
          }
        }
        break;
      case 'price':
        {
          listA = createList(mapList, 'quantity');
          listB = createList(mapList, 'price');
          for (int i = 0; i < listB.length; i++) {
            valueA = listA.elementAt(i);
            valueB = listB.elementAt(i);
            total = total + (valueA * valueB);
          }
        }
        break;
      default:
        {}
        break;
    }

    return total.toString();
  }

  List createList(List<Map> mapList, String type) {
    Map value;
    List newList = [];
    for (value in mapList) {
      newList.add(double.parse(value[type].toString()));
    }
    return newList;
  }

  Future<void> updateInventory(List<Map> mapList, String vendor) async {
    Map element;
    double total = 0;
    for (element in mapList) {
      await supabase
          .from('inventory')
          .select('stock')
          .eq('vendor', vendor)
          .eq('code', element['code']);
      //total =
      await supabase
          .from('inventory')
          .update({'stock': total})
          .eq('code', 'B5067')
          .eq('vendor', 'Daniel2');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primaryBackground,
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryBackground,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            // ignore: prefer_const_constructors
            icon: Icon(
              Icons.arrow_back_ios,
              color: ColorPalette.primaryText,
              size: 30,
            )),
        title: Text(
          'Formulario de ventas',
          style: Typo.title1,
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: TextFormField(
              controller: _clientController,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Nombre del cliente',
                hintStyle: Typo.hintText,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                filled: true,
                fillColor: ColorPalette.secondaryBackground,
              ),
              style: Typo.textField1,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.timePick.toString(),
                  style: Typo.labelText1,
                ),
                Text(widget.saleID, style: Typo.labelText1)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: ElevatedButton(
              onPressed: () async {
                await showModalBottomSheet(
                  isDismissible: false,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: SelectProduct(),
                    );
                  },
                ).then((value) => setState(() => _closeModal(value)));
              },
              child: Icon(
                Icons.add_shopping_cart,
                size: 30,
                color: ColorPalette.primaryText,
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPalette.tertiary,
                  minimumSize: Size(180, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Builder(
                builder: (context) {
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: shoppingCart.length,
                    itemBuilder: (context, index) {
                      final shoppingCartItem = shoppingCart[index];
                      return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
                          child: Container(
                            width: double.infinity,
                            height: 120,
                            decoration: BoxDecoration(
                                color: ColorPalette.secondaryBackground,
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: ColorPalette
                                                  .secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12)),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                    shoppingCartItem['code']
                                                        .toString(),
                                                    style: Typo.bodyText1),
                                                Text(
                                                  shoppingCartItem[
                                                          'description']
                                                      .toString(),
                                                  style: Typo.bodyText1,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.more_vert,
                                                color:
                                                    ColorPalette.secondaryText,
                                                size: 25))
                                      ]),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.28,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: ColorPalette.secondaryBackground,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12)),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            shoppingCartItem['quantity']
                                                .toString(),
                                            style: Typo.bodyText3,
                                          ),
                                          Text(
                                            'Cantidad',
                                            style: Typo.labelText2,
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color:
                                              ColorPalette.secondaryBackground),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                shoppingCartItem['weight']
                                                    .toString(),
                                                style: Typo.bodyText3,
                                              ),
                                              Text(
                                                'kg',
                                                style: Typo.bodyText3,
                                              )
                                            ],
                                          ),
                                          Text(
                                            'Peso unitario',
                                            style: Typo.labelText2,
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.36,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: ColorPalette
                                                .secondaryBackground,
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(12))),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '\$',
                                                  style: Typo.bodyText3,
                                                ),
                                                Text(
                                                  shoppingCartItem['price']
                                                      .toString(),
                                                  style: Typo.bodyText3,
                                                )
                                              ],
                                            ),
                                            Text(
                                              'Precio unitario',
                                              style: Typo.labelText2,
                                            )
                                          ],
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ));
                    },
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    '# de articulos:',
                    style: Typo.labelText1,
                  ),
                  Text(
                    operatorList(shoppingCart, 'quantity'),
                    style: Typo.bodyText4,
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Peso total:',
                    style: Typo.labelText1,
                  ),
                  Text(
                    operatorList(shoppingCart, 'weight'),
                    style: Typo.bodyText4,
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Precio total:',
                    style: Typo.labelText1,
                  ),
                  Text(
                    operatorList(shoppingCart, 'price'),
                    style: Typo.bodyText4,
                  )
                ],
              )
            ],
          ),
          Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 16, 8, 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: ColorPalette.primary),
                child: Text(
                  'Guardar',
                  style: Typo.textButton,
                ),
                onPressed: () async {
                  await supabase.from('sales').insert({
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
                },
              )),
        ],
      ),
    );
  }
}
