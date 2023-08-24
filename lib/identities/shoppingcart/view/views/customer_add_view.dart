import 'package:flutter/material.dart';

import '../../../../settings/theme.dart';
import '../widgets/customer_select/textfield_customer.dart';

class CustomerAddView extends StatelessWidget {
  final String vendor;
  final bool isLoading;
  const CustomerAddView(
      {super.key,
      required this.vendor,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 480,
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
              visible: isLoading,
              replacement: const SizedBox(height: 4),
              child: const LinearProgressIndicator(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: ColorPalette.secondaryBackground,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Vendedor:',
                                  style: Typo.bodyText6,
                                ),
                                Text(
                                  vendor,
                                  style: Typo.bodyText6,
                                ),
                              ],
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          TextfieldCustomer(
                            keyFormElement: 0,
                            label: 'Nombre de cliente',
                            isLoading: isLoading,
                          ),
                          // ignore: prefer_const_constructors
                          TextfieldCustomer(
                            keyFormElement: 1,
                            label: 'Dirección',
                            isLoading: isLoading,
                          ),
                          // ignore: prefer_const_constructors
                          TextfieldCustomer(
                            keyFormElement: 2,
                            label: 'Colonia',
                            isLoading: isLoading,
                          ),
                          // ignore: prefer_const_constructors
                          TextfieldCustomer(
                            keyFormElement: 3,
                            label: 'Municiopio',
                            isLoading: isLoading,
                          ),
                          // ignore: prefer_const_constructors
                          TextfieldCustomer(
                            keyFormElement: 4,
                            label: 'Estado',
                            isLoading: isLoading,
                          ),
                        ],
                      ),
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
                              'Guardar',
                              style: Typo.textButton,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: ColorPalette.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            minimumSize: const Size(60, 60),
                          ),
                          child: const Icon(
                            Icons.keyboard_return,
                            color: ColorPalette.primaryText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));

    /*Container(
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
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              FinderCustomer(rcList: rcList),
              Visibility(
                  visible: isLoading, child: const LinearProgressIndicator()),
              Expanded(child: ListviewCustomer(listData: rcList)),
              const SizedBox(height: 8),
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
                        'Cancelar',
                        style: Typo.textButton,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: ColorPalette.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      minimumSize: const Size(60, 60),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: ColorPalette.primaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));*/
  }
}
