import 'package:axol_rutas/identities/sale/view/controllers/saleslist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global_widgets/appbar_global.dart';
import '../../../../settings/theme.dart';
import '../../cubit/sales_list/saleslist_cubit.dart';
import '../../cubit/textfield_finder_sale_cubit.dart';
import '../widgets/sale_detail/labels_sale_details.dart';
import '../widgets/sales_list/fabutton_add_sale.dart';
import '../widgets/sales_list/textfield_finder_sale.dart';

class SalesView extends StatelessWidget {
  const SalesView({super.key});

  @override
  Widget build(BuildContext context) {
    const String TITLE = 'Ventas';

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SalesListCubit()),
        BlocProvider(create: (_) => TextFieldFinderSaleCubit()),
      ],
      child: Scaffold(
        backgroundColor: ColorPalette.primaryBackground,
        floatingActionButton: const FABtnAddSale(),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarGlobal(title: TITLE, iconButton: null),
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
      ),
    );
  }
}
