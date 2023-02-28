// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:convert';

import 'package:axol_rutas/settings/format.dart';
import 'package:axol_rutas/settings/jsonList.dart';
import 'package:flutter/material.dart';
import '../settings/theme.dart';
import 'package:axol_rutas/pages/components/select_product.dart';

final _clientController = TextEditingController();

@override
void dispose() {
  _clientController.dispose();
}

class SalesForm extends StatefulWidget {
  const SalesForm({super.key, required this.timePick, required this.saleID});

  final DateTime timePick;
  final String saleID;

  @override
  _SalesPageState createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesForm> {
  List<Map> shoppingCart = [];

  void _closeModal(Map result) {
    if (result['isEmpty'] == false) {
      shoppingCart.add(result['value']);
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
          'Formuario de ventas',
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
                    '0000',
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
                    '0000',
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
                    '0000',
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
                onPressed: () {},
              )),
        ],
      ),
    );
  }
}
