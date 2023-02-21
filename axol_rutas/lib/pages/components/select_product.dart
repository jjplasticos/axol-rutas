// ignore_for_file: prefer_const_constructors

import 'package:axol_rutas/settings/theme.dart';
import 'package:flutter/material.dart';

final _searchController = TextEditingController();

@override
void dispose() {
  _searchController.dispose();
}

class SelectProduct extends StatefulWidget {
  const SelectProduct({super.key});

  @override
  _SelectProductState createState() => _SelectProductState();
}

class _SelectProductState extends State<SelectProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 303.5,
      height: 479.7,
      decoration: BoxDecoration(
        color: ColorPalette.primaryBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.search, size: 15),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(50, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8))),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                          hintText: 'Buscar',
                          hintStyle: Typo.hintText,
                          filled: true,
                          fillColor: ColorPalette.secondaryBackground),
                      style: Typo.textField1,
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
