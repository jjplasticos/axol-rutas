import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settings/theme.dart';
import '../../cubit/customer_form/customer_form_cubit.dart';
import '../../cubit/customer_form/customer_formview_cubit.dart';
import '../../cubit/customer_select/custselc_cubit/custselec_cubit.dart';
import '../../model/route_customer_model.dart';
import '../controllers/rc_add_controller.dart';
import '../widgets/customer_select/finder_customer.dart';
import '../widgets/customer_select/listview_customer.dart';

class CustomerSelectView extends StatelessWidget {
  final List<RouteCustomerModel> rcList;
  final bool isLoading;
  const CustomerSelectView(
      {super.key, required this.rcList, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 303.5,
        height: 500,
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
                  visible: isLoading,
                  child: const LinearProgressIndicator(
                    color: ColorPalette.primary,
                    backgroundColor: ColorPalette.secondaryBackground,
                  )),
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
                        'Regresar',
                        style: Typo.textButton,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      if (isLoading == false) {
                        showModalBottomSheet(
                          isDismissible: true,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) => MultiBlocProvider(
                            providers: [
                              BlocProvider(create: (_) => CustomerFormCubit()),
                              BlocProvider(
                                  create: (_) => CustomerFormviewCubit()),
                            ],
                            child: const RcAddController(),
                          ),
                        ).then((value) {
                          if (value == true) {
                            context.read<CustselecCubit>().load('', rcList);
                          }
                        });
                      }
                    },
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
        ));
  }
}
