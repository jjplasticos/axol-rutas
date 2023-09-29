// ignore_for_file: use_build_context_synchronously, prefer_const_constructors
import 'package:flutter/material.dart';

import '../../../../globals/global_const.dart';
import '../../../../globals/global_widgets/appbar/appbar_global.dart';
import '../../../../globals/global_widgets/appbar/iconbutton_return.dart';
import '../../../../globals/global_widgets/bottom_navigation_bar/navigation_bar_global.dart';
import '../../../../settings/theme.dart';
import '../../../user/model/user.dart';
import '../../../user/repository/user_repo.dart';
import '../../../user/view/pages/auth_page.dart';
import '../../model/sale_model.dart';
import '../widgets/sales_list/fabutton_add_sale.dart';
import '../widgets/sales_list/listview_sales.dart';
import '../widgets/sales_list/textfield_finder_sale.dart';

class SalesView extends StatelessWidget {
  final bool isLoading;
  final UserModel user;
  final List<SaleModel> listData;
  const SalesView({
    super.key,
    required this.isLoading,
    required this.user,
    required this.listData,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: constant_identifier_names
    const String TITLE = 'Ventas';

    return Scaffold(
        backgroundColor: ColorPalette.primaryBackground,
        floatingActionButton:
            (user.rol == 'admin' || isLoading == true) ? null : FABtnAddSale(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarGlobal(
              title: TITLE,
              iconButton: (user.rol == 'admin')
                  ? IconButtonReturn(
                      iconName: 'return',
                      isLoading: isLoading,
                    )
                  : null,
              actions: [
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () async {
                        await LocalUser().removeLocalUser();
                        await LocalUser().removeLocalVendor();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthPage()));
                      },
                      child: const Text('Logout'),
                    ),
                    const PopupMenuItem(
                      child: Text(GlobalConst.version),
                    )
                  ],
                )
                /*IconButton(onPressed: () {
                    
                  }, 
                  icon: const Icon(Icons.menu))*/
              ]),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Visibility(
                visible: isLoading,
                replacement: const SizedBox(
                  height: 4,
                ),
                child: const LinearProgressIndicator(
                  color: ColorPalette.primary,
                  backgroundColor: ColorPalette.secondaryBackground,
                )),
            Expanded(
                child: Column(
              children: [
                Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: ColorPalette.secondaryBackground),
                        child: TextFieldFinderSale())),
                Expanded(
                    child: ListViewSales(
                  listData: listData,
                )),
              ],
            )),
          ],
        ),
        bottomNavigationBar: const NavigationBarGlobal(currentIndex: 0));
  }
}
