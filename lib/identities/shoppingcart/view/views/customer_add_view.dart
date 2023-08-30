import 'package:axol_rutas/identities/shoppingcart/cubit/customer_form/customer_formview_cubit.dart';
import 'package:axol_rutas/identities/shoppingcart/model/addcustomer_form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settings/theme.dart';
import '../../cubit/customer_form/customer_form_cubit.dart';
import '../../model/route_customer_model.dart';
import '../../repository/routecustomer_repo.dart';
import '../widgets/customer_select/textfield_customer.dart';

class CustomerAddView extends StatelessWidget {
  final String vendor;
  final bool isLoading;
  const CustomerAddView(
      {super.key, required this.vendor, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    AddcustomerFormModel currentForm;
    RouteCustomerModel rc;
    int focus = context.read<CustomerFormCubit>().state.focus;
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
                      child: ListView(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: ColorPalette.secondaryBackground,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Vendedor:',
                                          style: Typo.bodyText6,
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              vendor,
                                              style: Typo.bodyText6,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    // ignore: prefer_const_constructors
                                    TextfieldCustomer(
                                      keyFormElement: 0,
                                      label: 'Nombre de cliente:',
                                      isLoading: isLoading,
                                      isFocus: focus == 0,
                                    ),
                                    // ignore: prefer_const_constructors
                                    TextfieldCustomer(
                                      keyFormElement: 1,
                                      label: 'Dirección:',
                                      isLoading: isLoading,
                                      isFocus: focus == 1,
                                    ),
                                    // ignore: prefer_const_constructors
                                    TextfieldCustomer(
                                      keyFormElement: 2,
                                      label: 'Colonia:',
                                      isLoading: isLoading,
                                      isFocus: focus == 2,
                                    ),
                                    // ignore: prefer_const_constructors
                                    TextfieldCustomer(
                                      keyFormElement: 3,
                                      label: 'Municiopio:',
                                      isLoading: isLoading,
                                      isFocus: focus == 3,
                                    ),
                                    // ignore: prefer_const_constructors
                                    TextfieldCustomer(
                                      keyFormElement: 4,
                                      label: 'Estado:',
                                      isLoading: isLoading,
                                      isFocus: focus == 4,
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              RoutecustomerRepo().availableId();
                              context.read<CustomerFormCubit>().allValidate();
                              currentForm =
                                  context.read<CustomerFormCubit>().state;
                              rc = RouteCustomerModel(
                                id: -1,
                                name: currentForm.name.value,
                                location: '',
                                address: {
                                  RouteCustomerModel.pAddress:
                                      currentForm.address.value,
                                  RouteCustomerModel.pHood:
                                      currentForm.hood.value,
                                  RouteCustomerModel.pTown:
                                      currentForm.town.value,
                                  RouteCustomerModel.pCountry:
                                      currentForm.country.value,
                                },
                                validation: {
                                  RouteCustomerModel.pStatus: false,
                                  RouteCustomerModel.pAdminUser: '',
                                },
                                vendor: vendor,
                              );
                              context
                                  .read<CustomerFormviewCubit>()
                                  .save(vendor, rc);
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
                          onPressed: () {
                            Navigator.pop(context);
                          },
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
  }
}
