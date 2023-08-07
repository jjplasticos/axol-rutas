import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../global_widgets/global_models/textfield_model.dart';
import '../../../../../settings/theme.dart';
import '../../../cubit/customer_select/custselc_cubit/custselec_cubit.dart';
import '../../../cubit/customer_select/finder_customer_cubit.dart';
import '../../../model/route_customer_model.dart';

class FinderCustomer extends StatelessWidget {
  final List<RouteCustomerModel> rcList;
  const FinderCustomer({super.key, required this.rcList});

  @override
  Widget build(BuildContext context) {
    /*final txtValue = context.watch<FinderTxtCubit>().state;
    final controller = TextEditingController()
      ..text = txtValue
      ..selection = TextSelection.collapsed(offset: txtValue.length);*/
    final TextfieldModel currentFinder = context.read<FinderCustomerCubit>().state;
    final TextEditingController controller = TextEditingController()
      ..text = currentFinder.text
      ..selection = TextSelection.collapsed(offset: currentFinder.position);

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
            child: TextField(
              controller: controller,
              autofocus: false,
              obscureText: false,
              onChanged: (value) {
                context.read<FinderCustomerCubit>().change(
                  TextfieldModel(
                  text: value, 
                  position: controller.selection.base.offset)
                );
              },
              onSubmitted: (value){
                context.read<CustselecCubit>().load(value, rcList);
              },
              decoration: InputDecoration(
                  hintText: 'Buscar',
                  hintStyle: Typo.hintText,
                  filled: true,
                  fillColor: ColorPalette.secondaryBackground,
                  border: InputBorder.none),
              style: Typo.textField1,
            ),
          ),
        ),
        IconButton(
          iconSize: 30,
          color: ColorPalette.secondaryText,
          icon: const Icon(
            Icons.cancel,
          ),
          onPressed: () {
            context.read<FinderCustomerCubit>().change(
                  const TextfieldModel(
                  text: '', 
                  position: 0)
                );
            context.read<CustselecCubit>().load('', rcList);
          },
        )
      ],
    );
  }
}