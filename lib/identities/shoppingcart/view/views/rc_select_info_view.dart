import 'package:flutter/material.dart';

import '../../../../settings/theme.dart';
import '../../model/route_customer_model.dart';

class RcSelectInfoView extends StatelessWidget {
  final RouteCustomerModel customer;
  const RcSelectInfoView({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 303.5,
        height: 480,
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
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorPalette.secondaryBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView(
                  
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${customer.id}    ',
                          style: Typo.bodyText1,
                        ),
                        Expanded(
                            child: Text(
                          customer.name,
                          style: Typo.bodyText1,
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Dirección: ',
                          style: Typo.bodyText6,
                        ),
                        Expanded(
                            child: Text(
                          customer.address,
                          style: Typo.bodyText6,
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Municipio: ',
                          style: Typo.bodyText6,
                        ),
                        Expanded(
                            child: Text(
                          customer.town,
                          style: Typo.bodyText6,
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Estado: ',
                          style: Typo.bodyText6,
                        ),
                        Expanded(
                            child: Text(
                          customer.country,
                          style: Typo.bodyText6,
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Giro: ',
                          style: Typo.bodyText6,
                        ),
                        Expanded(
                            child: Text(
                          customer.sector,
                          style: Typo.bodyText6,
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Validación: ',
                          style: Typo.bodyText6,
                        ),
                        customer.validation[RouteCustomerModel.pStatus] == false
                            ? const Icon(
                                Icons.check_box_outline_blank_outlined,
                                color: ColorPalette.secondaryText,
                              )
                            : const Icon(Icons.check_box_outlined,
                                color: ColorPalette.secondaryText)
                      ],
                    ),
                  ],
                ),
              )),
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
                        'Regresar',
                        style: Typo.textButton,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
