import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settings/theme.dart';
import '../../cubit/product_finder/product_finder_cubit.dart';
import '../../cubit/shoppingcart_txt_cubit.dart';
import '../../model/shoppingcart_models.dart';
import '../controllers/listview_productfinder_controller.dart';
import '../widgets/product_finder/btn_cancel_product_finder.dart';
import '../widgets/product_finder/txt_finder.dart';

class ProdctFinderView extends StatelessWidget {
  final List<ShoppingcartItemModel> shoppingcart;

  const ProdctFinderView({super.key, required this.shoppingcart});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ProductFinderCubit()),
          BlocProvider(create: (_) => FinderTxtCubit()),
        ],
        child: Container(
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
                Expanded(
                    child: ListviewProductFinderController(
                  filter: '',
                  shoppingcart: shoppingcart,
                )),
                Padding(
                  padding: const EdgeInsetsDirectional.all(8),
                  child: BtnCancelProductFinder(shoppingcart: shoppingcart),
                )
              ],
            ),
          ),
        ));
  }
}
