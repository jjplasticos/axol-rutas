import 'package:axol_rutas/identities/inventory/view/widgets/finder_inventory.dart';
import 'package:flutter/material.dart';

import '../../../../globals/global_widgets/appbar/appbar_global.dart';
import '../../../../globals/global_widgets/appbar/iconbutton_return.dart';
import '../../../../globals/global_widgets/bottom_navigation_bar/navigation_bar_global.dart';
import '../../../../settings/theme.dart';
import '../../../user/model/user.dart';
import '../../model/inventory_model.dart';
import '../widgets/listview_inventory.dart';

class InventoryView extends StatelessWidget {
  final List<InventoryModel> listData;
  final bool isLoading;
  final UserModel user;
  const InventoryView(
      {super.key,
      required this.listData,
      required this.isLoading,
      required this.user});

  @override
  Widget build(BuildContext context) {
    const String title = 'Inventario';

    return Scaffold(
        backgroundColor: ColorPalette.primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarGlobal(
            title: title,
            iconButton: user.id > -1
                ? IconButtonReturn(
                    iconName: 'return',
                    isLoading: isLoading,
                    route: '/VendorsListController',
                  )
                : null,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Visibility(
                replacement: const SizedBox(
                  height: 4,
                ),
                visible: isLoading,
                child: const LinearProgressIndicator(
                  color: ColorPalette.primary,
                  backgroundColor: ColorPalette.secondaryBackground,
                ),
              ),
              // ignore: prefer_const_constructors
              FinderInventory(),
              Expanded(child: ListviewInventory(listData: listData)),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    color: ColorPalette.secondaryBackground,
                    iconSize: 30,
                    onPressed: (){}, 
                    icon: const Icon(Icons.picture_as_pdf),
                    ),
                ],
              )*/
            ],
          ),
        ),
        bottomNavigationBar: const NavigationBarGlobal(currentIndex: 1));
  }
}
