import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settings/theme.dart';
import '../../cubit/inv_product/inv_product_form_cubit.dart';
import '../../cubit/inv_product/inv_product_view_cubit.dart';
import '../../cubit/inventory_form_cubit.dart';
import '../../cubit/inventory_view/inventory_view_cubit.dart';
import '../../model/inventory_diff_model.dart';
import '../../model/inventory_form_model.dart';
import '../../model/inventory_model.dart';
import '../controllers/inv_product_detail_controller.dart';

class ListviewInventory extends StatelessWidget {
  final List<InventoryModel> listData;

  const ListviewInventory({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    InventoryFormModel form = context.read<InventoryFormCubit>().state;
    return ListView.builder(
      //padding: const EdgeInsets.only(top: 8),
      shrinkWrap: true,
      itemCount: listData.length,
      itemBuilder: ((context, index) {
        final elementList = listData[index];
        return Padding(
          padding: const EdgeInsetsDirectional.only(top: 8),
          child: OutlinedButton(
            onPressed: () {
              showModalBottomSheet(
                isDismissible: true,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (_) => InvProductViewCubit()),
                    BlocProvider(create: (_) => InvProductFormCubit()),
                  ],
                  child: InvProductDtailController(
                    index: index,
                    diffList: form.diffList,
                    //product: elementList.product,
                    //stock: double.parse(elementList.stock)
                  ),
                ),
              ).then((value) {
                if (value is List<InventoryDiffModel>) {
                  //final List<InventoryDiffModel> v = value;
                  context.read<InventoryFormCubit>().changeDiff(value);
                  context.read<InventoryViewCubit>().load(form);
                }
              });
            },
            child: Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                    color: colorStatus(
                      form.diffList.elementAt(index).isCheck,
                      form.diffList.elementAt(index).stock,
                      form.diffList.elementAt(index).actualStock,
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      elementList.code,
                      style: Typo.bodyText1,
                    ),
                    Text(
                      elementList.product.description,
                      style: Typo.bodyText1,
                    ),
                    Text(
                      elementList.stock,
                      style: Typo.bodyText1,
                    )
                  ],
                )),
          ),
        );
      }),
    );
  }

  Color colorStatus(bool isCheck, double stock, double actualStock) {
    if (isCheck) {
      if (stock == actualStock) {
        return ColorPalette.primary;
      } else {
        return ColorPalette.alternate;
      }
    } else {
      return ColorPalette.secondaryBackground;
    }
  }
}
