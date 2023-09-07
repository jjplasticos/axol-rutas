// ignore_for_file: use_build_context_synchronously

import 'package:axol_rutas/identities/sale/view/controllers/saleslist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../globals/global_const.dart';
import '../../../../globals/global_widgets/appbar/appbar_global.dart';
import '../../../../globals/global_widgets/bottom_navigation_bar/navigation_bar_global.dart';
import '../../../../settings/theme.dart';
import '../../../user/repository/user_repo.dart';
import '../../../user/view/pages/auth_page.dart';
import '../../cubit/sales_list/saleslist_cubit.dart';
import '../../cubit/textfield_finder_sale_cubit.dart';
import '../widgets/sales_list/fabutton_add_sale.dart';
import '../widgets/sales_list/textfield_finder_sale.dart';

class SalesView extends StatelessWidget {
  const SalesView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: constant_identifier_names
    const String TITLE = 'Venta';

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SalesListCubit()),
        BlocProvider(create: (_) => TextFieldFinderSaleCubit()),
      ],
      child: Scaffold(
          backgroundColor: ColorPalette.primaryBackground,
          floatingActionButton: const FABtnAddSale(),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBarGlobal(title: TITLE, actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () async {
                      await LocalUser().removeLocalUser();
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
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorPalette.secondaryBackground),
                      child: const TextFieldFinderSale())),
              const Expanded(child: SaleController()),
            ],
          ),
          bottomNavigationBar: const NavigationBarGlobal(currentIndex: 0)),
    );
  }
}
