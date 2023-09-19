import 'package:axol_rutas/identities/sale/cubit/sales_report/srep_form_cubit.dart';
import 'package:axol_rutas/identities/sale/view/controllers/sales_report_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../identities/inventory/cubit/inventory_form_cubit.dart';
import '../../../identities/inventory/cubit/inventory_view/inventory_view_cubit.dart';
import '../../../identities/inventory/view/controllers/inventory_controller.dart';
import '../../../identities/inventory/view/views/inventory_view.dart';
import '../../../identities/sale/cubit/sales_cubit/sales_view_cubit.dart';
import '../../../identities/sale/cubit/sales_report/salesreport_cubit.dart';
import '../../../identities/sale/view/controllers/salesview_controller.dart';
import '../../../identities/sale/view/views/sales_view.dart';
import '../../../settings/theme.dart';

class NavigationBarGlobal extends StatelessWidget {
  final int currentIndex;
  const NavigationBarGlobal({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: ColorPalette.primary,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Ventas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory),
          label: 'Inventaio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description_outlined),
          label: 'Reporte de ventas',
        ),
      ],
      backgroundColor: ColorPalette.secondaryBackground,
      currentIndex: currentIndex,
      onTap: (value) {
        switch (value) {
          case 0:
            if (currentIndex != value) {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      // ignore: prefer_const_constructors
                      builder: (context) => BlocProvider(
                            create: (_) => SalesViewCubit(),
                            // ignore: prefer_const_constructors
                            child: SalesViewController(),
                          )));
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SalesView()),
              );*/
            }
            break;
          case 1:
            if (currentIndex != value) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiBlocProvider(providers: [
                    BlocProvider(create: (_) => InventoryViewCubit()),
                    BlocProvider(create: (_) => InventoryFormCubit()),
                  // ignore: prefer_const_constructors
                  ], child: InventoryController()),
                ),
              );
            }
            break;
          case 2:
            if (currentIndex != value) {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MultiBlocProvider(providers: [
                            BlocProvider(create: (_) => SalesReportCubit()),
                            BlocProvider(create: (_) => SRepFormCubit()),
                          ], child: const SalesReportController())));
            }
            break;
          default:
        }
      },
    );
  }
}
