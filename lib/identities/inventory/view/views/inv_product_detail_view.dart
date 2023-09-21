import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settings/theme.dart';
import '../../../user/model/user.dart';
import '../../cubit/inv_product/inv_product_form_cubit.dart';
import '../../model/inv_product_form_model.dart';

class InvProductDetailView extends StatelessWidget {
  final UserModel user;
  final bool isLoading;
  const InvProductDetailView(
      {super.key, required this.user, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    InvProductFormModel form = context.read<InvProductFormCubit>().state;
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
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.add_circle_outline,
                                                color: ColorPalette.primary,
                                              ),
                                            ),
                                            Expanded(
                                              child: TextField(
                                                textAlign: TextAlign.center,
                                                cursorColor:
                                                    ColorPalette.primary,
                                                // inputFormatters: inputFormatter,
                                                //controller: textController,
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
                                                onPressed: () {},
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
                                          value: form.isComplete,
                                          onChanged: (value) {},
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
                            Navigator.pop(context);
                          },
                          style: OutlinedButton.styleFrom(
                              backgroundColor: ColorPalette.primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              minimumSize: const Size(60, 60),
                              maximumSize: const Size(double.infinity, 60)),
                          child: const Text(
                            'Regresar',
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
