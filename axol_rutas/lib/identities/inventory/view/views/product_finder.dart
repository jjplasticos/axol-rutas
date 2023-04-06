import 'package:flutter/material.dart';

import '../../../../settings/theme.dart';
import '../widgets/product_finder/listview_product_finder.dart';
import '../widgets/product_finder/txt_finder.dart';

class ProductFinder extends StatelessWidget {
  const ProductFinder({super.key});

  /*final _searchController = TextEditingController();
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
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 303.5,
      height: 479.7,
      decoration: const BoxDecoration(
        color: ColorPalette.primaryBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorPalette.secondaryBackground),
                    child: const TextFieldFinder())),
            const Expanded(
                child: ListviewProductFinder(
              products: [],
            )
                /*FutureBuilder<List<Map<String, dynamic>>>(
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
                return 
              },
            )*/
                ),
            Padding(
              padding: const EdgeInsetsDirectional.all(8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: ColorPalette.secondary),
                child: const Text(
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
