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
              Visibility(visible: isLoading, child: const LinearProgressIndicator()),
              Expanded(child: ListviewCustomer(listData: rcList)),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'),
              )
            ],
          ),
        ));
  }
}
