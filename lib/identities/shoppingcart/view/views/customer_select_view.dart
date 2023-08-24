import 'package:flutter/material.dart';

import '../../../../settings/theme.dart';
import '../../model/route_customer_model.dart';
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
                  const SizedBox(width: 8,),
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
        ));
  }
}
