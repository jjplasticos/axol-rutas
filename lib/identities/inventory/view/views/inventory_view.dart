import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global_widgets/appbar/appbar_global.dart';
import '../../../../global_widgets/bottom_navigation_bar/navigation_bar_global.dart';
import '../../../../settings/theme.dart';
import '../../cubit/listview_inventory/listview_inventory_cubit.dart';
import '../controllers/listview_inventory_controller.dart';

class InventoryView extends StatelessWidget {
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    const String TITLE = 'Inventario';

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ListviewInventoryCubit()),
        //BlocProvider(create: (_) => TextFieldFinderSaleCubit()),
      ],
      child: Scaffold(
          backgroundColor: ColorPalette.primaryBackground,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child:
                AppBarGlobal(title: TITLE, iconButton: null, iconActions: []),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: Container(
                      /*
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorPalette.secondaryBackground),
                      child: const TextFieldFinderSale()*/
                      )),
              const Expanded(child: ListviewInventoryController()),
            ],
          ),
          bottomNavigationBar: const NavigationBarGlobal(currentIndex: 1)),
    );
  }
}
