// ignore_for_file: prefer_const_constructors

import 'package:axol_rutas/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  final _future = Supabase.instance.client
      .from('inventory')
      .select<List<Map<String, dynamic>>>();

  @override
  Widget build(BuildContext context) {
    bool showList = false;
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
                    child: Icon(
                      Icons.search,
                      size: 15,
                      color: ColorPalette.primaryText,
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(50, 48),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8))),
                        backgroundColor: ColorPalette.primary),
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
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.cancel,
                      color: ColorPalette.secondaryText,
                      size: 15,
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(50, 48),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8))),
                        backgroundColor: ColorPalette.secondaryBackground),
                  )
                ],
              ),
            ),
            if (showList == false)
              Expanded(
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _future,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final listData = snapshot.data!;

                  listData.forEach((element) {});
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: listData.length,
                      itemBuilder: ((context, index) {
                        final elementList = listData[index];
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.75,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: ColorPalette
                                                  .secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  topLeft:
                                                      Radius.circular(12))),
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
                                                    elementList['stock'],
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
                                      onPressed: () {},
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
              ))
            else
              Expanded(child: Builder(
                builder: (context) {
                  final listData = [];

                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: listData.length,
                      itemBuilder: ((context, index) {
                        final elementList = listData[index];
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.75,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: ColorPalette
                                                  .secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  topLeft:
                                                      Radius.circular(12))),
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
                                                    elementList['stock'],
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
                                      onPressed: () {},
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
              ))
          ],
        ),
      ),
    );
  }
}

/*List searchInList(List<Map<String, dynamic>> listData) {
  listData.forEach((element) {
    element
  });
}*/
