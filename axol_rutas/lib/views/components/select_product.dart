// ignore_for_file: prefer_const_constructors

import 'package:axol_rutas/views/components/select_product_form.dart';
import 'package:axol_rutas/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SelectProduct extends StatefulWidget {
  const SelectProduct({super.key});

  @override
  _SelectProductState createState() => _SelectProductState();
}

class _SelectProductState extends State<SelectProduct> {
  final _searchController = TextEditingController();
  final _future = Supabase.instance.client
      .from('inventory')
      .select<List<Map<String, dynamic>>>();
  List<Map<String, dynamic>> listData = [];
  List<Map<String, dynamic>> _listProducts = [];
  bool isVisible = false;
  int count = 0;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _runFilter(String enteredKeyboard) {
    List<Map<String, dynamic>>? result = [];
    isVisible = true;
    if (enteredKeyboard.isEmpty) {
      result = listData;
    } else {
      result = listData
          .where((element) => element['code']
              .toLowerCase()
              .contains(enteredKeyboard.toLowerCase()))
          .toList();
    }

    setState(() {
      _listProducts = result!;
    });
  }

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
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ColorPalette.secondaryBackground),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: TextFormField(
                            controller: _searchController,
                            autofocus: false,
                            obscureText: false,
                            onChanged: (value) => _runFilter(value),
                            decoration: InputDecoration(
                                hintText: 'Buscar',
                                hintStyle: Typo.hintText,
                                filled: true,
                                fillColor: ColorPalette.secondaryBackground,
                                border: InputBorder.none),
                            style: Typo.textField1,
                          ),
                        ),
                      ),
                      IconButton(
                        iconSize: 30,
                        color: ColorPalette.secondaryText,
                        icon: Icon(
                          Icons.cancel,
                        ),
                        onPressed: () {
                          _searchController.clear();
                          _runFilter('');
                        },
                      )
                    ],
                  ),
                )),
            Expanded(
                child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _future,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData && count < 3) {
                  //print('hola mundo 3');
                  count++;
                }
                if (count > 1) {
                  listData = snapshot.data!;
                } else {
                  listData = snapshot.data!;
                  _listProducts = snapshot.data!;
                }
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: _listProducts.length,
                    itemBuilder: ((context, index) {
                      final elementList = _listProducts[index];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: ColorPalette.secondaryBackground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: ColorPalette
                                                .secondaryBackground,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                topLeft: Radius.circular(12))),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              elementList['code'],
                                              style: Typo.bodyText6,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text('Stock: ',
                                                    style: Typo.bodyText6),
                                                Text(
                                                  elementList['stock']
                                                      .toString(),
                                                  style: Typo.bodyText6,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Text(
                                        elementList['description'],
                                        style: Typo.bodyText1,
                                      )
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                          isDismissible: false,
                                          isScrollControlled: true,
                                          backgroundColor:
                                              ColorPalette.primaryBackground,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: SelectProductForm(
                                                code: elementList['code'],
                                                description:
                                                    elementList['description'],
                                                stock: elementList['stock'],
                                                weight: elementList['weight'],
                                              ),
                                            );
                                          }).whenComplete(() => null);
                                    },
                                    icon: Icon(
                                      Icons.navigate_next,
                                      color: ColorPalette.secondaryText,
                                      size: 30,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }));
              },
            )),
            Padding(
              padding: EdgeInsetsDirectional.all(8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: ColorPalette.secondary),
                child: Text(
                  'Cancelar',
                  style: Typo.textButton,
                ),
                onPressed: () {
                  const bool flag = true;
                  final Map result = {'isEmpty': flag};
                  Navigator.pop(context, result);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
