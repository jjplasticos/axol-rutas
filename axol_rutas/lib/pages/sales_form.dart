// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:convert';

import 'package:axol_rutas/settings/format.dart';
import 'package:flutter/material.dart';
import '../settings/theme.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primaryBackground,
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryBackground,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {},
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
              autofocus: true,
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
              onPressed: () {},
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
        ],
      ),
    );
  }
}
