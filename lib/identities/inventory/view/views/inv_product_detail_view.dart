import 'package:axol_rutas/identities/inventory/cubit/inv_product/inv_product_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settings/theme.dart';
import '../../../user/model/user.dart';
import '../../cubit/inv_product/inv_product_form_cubit.dart';
import '../../model/inv_product_form_model.dart';
import '../../model/inventory_diff_model.dart';

class InvProductDetailView extends StatelessWidget {
  final UserModel user;
  final bool isLoading;
  final List<InventoryDiffModel> diffList;
  final int index;
  const InvProductDetailView(
      {super.key, required this.user, required this.isLoading, required this.diffList, required this.index});

  @override
  Widget build(BuildContext context) {
    List<InventoryDiffModel> newDiffList = [];
    InventoryDiffModel diff;
    double countN;
    InvProductFormModel form = context.read<InvProductFormCubit>().state;
    TextEditingController textController = TextEditingController();
    textController.value = TextEditingValue(
        text: form.counter.text,
        selection: TextSelection.collapsed(offset: form.counter.position));
    return Container(
        width: 303.5,
        height: 240,
        decoration: const BoxDecoration(
          color: ColorPalette.primaryBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
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
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                          //width: double.infinity,
                          decoration: const BoxDecoration(
                            color: ColorPalette.secondaryBackground,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      form.product.code,
                                      style: Typo.bodyText1,
                                    ),
                                    Text(
                                      'Stock: ${form.stock}',
                                      style: Typo.bodyText1,
                                    ),
                                  ],
                                ), //code, stock
                                Center(
                                  child: Text(
                                    form.product.description,
                                    style: Typo.bodyText1,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Visibility(
                                  visible: user.rol == 'admin',
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 40,
                                        width: 200,
                                        child: Row(
                                          children: [
                                            IconButton(
                                              iconSize: 40,
                                              onPressed: () {
                                                if (form.isComplete == false) {
                                                  if (double.tryParse(textController.text) == null) {
                                                    textController.text = '0';
                                                  }
                                                  countN = double.parse(
                                                      textController.text);
                                                  countN = countN + 1;
                                                  context
                                                      .read<
                                                          InvProductFormCubit>()
                                                      .changeCounter(
                                                        countN.toString(),
                                                        textController.selection
                                                            .base.offset,
                                                      );
                                                  context
                                                      .read<
                                                          InvProductViewCubit>()
                                                      .load();
                                                }
                                              },
                                              icon: const Icon(
                                                Icons.add_circle_outline,
                                                color: ColorPalette.primary,
                                              ),
                                            ),
                                            Expanded(
                                              child: TextField(
                                                enabled: !form.isComplete,
                                                textAlign: TextAlign.center,
                                                cursorColor:
                                                    ColorPalette.primary,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp(
                                                          r'^\d*\.?\d*$'))
                                                ],
                                                keyboardType: TextInputType.number,
                                                controller: textController,
                                                decoration:
                                                    const InputDecoration(
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: ColorPalette
                                                                  .primary)),
                                                ),
                                                onSubmitted: (value) {},
                                                onChanged: (value) {},
                                              ),
                                            ),
                                            IconButton(
                                                iconSize: 40,
                                                onPressed: () {
                                                  if (form.isComplete ==
                                                      false) {
                                                        if (double.tryParse(textController.text) == null) {
                                                    textController.text = '0';
                                                  }
                                                    countN = double.parse(
                                                        textController.text);
                                                    countN = countN - 1;
                                                    context
                                                        .read<
                                                            InvProductFormCubit>()
                                                        .changeCounter(
                                                          countN.toString(),
                                                          textController
                                                              .selection
                                                              .base
                                                              .offset,
                                                        );
                                                    context
                                                        .read<
                                                            InvProductViewCubit>()
                                                        .load();
                                                  }
                                                },
                                                icon: const Icon(
                                                  Icons.remove_circle_outline,
                                                  color: ColorPalette.primary,
                                                ))
                                          ],
                                        ),
                                      ),
                                      Transform.scale(
                                        scale: 1.5,
                                        child: Checkbox(
                                          activeColor: ColorPalette.primary,
                                          checkColor: ColorPalette.primaryText,
                                          value: form.isComplete,
                                          onChanged: (value) {
                                            if (value != null) {
                                              context
                                                  .read<InvProductFormCubit>()
                                                  .changeIsComplete(
                                                    value,
                                                    textController
                                                        .selection.base.offset,
                                                  );
                                              context
                                                  .read<InvProductViewCubit>()
                                                  .load();
                                            }
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ), //description
                              ],
                            ),
                          ))),
                  //numeric textfield, checkbox; (solo para admin)
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            diff = InventoryDiffModel(
                              product: diffList.elementAt(index).product, 
                              stock: diffList.elementAt(index).stock, 
                              actualStock: double.parse(form.counter.text), 
                              isCheck: true);
                            for (int i = 0; i < diffList.length; i++) {
                              if (i == index) {
                                newDiffList.add(diff);
                              } else {
                                newDiffList.add(diffList.elementAt(i));
                              }
                            }
                            Navigator.pop(context, newDiffList);
                          },
                          style: OutlinedButton.styleFrom(
                              backgroundColor: ColorPalette.primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              minimumSize: const Size(60, 60),
                              maximumSize: const Size(double.infinity, 60)),
                          child: const Text(
                            'Guardar',
                            style: Typo.textButton,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ));
  }
}
