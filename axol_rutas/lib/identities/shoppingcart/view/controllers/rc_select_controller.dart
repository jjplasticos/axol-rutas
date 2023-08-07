import 'package:axol_rutas/identities/shoppingcart/view/views/customer_select_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settings/theme.dart';
import '../../cubit/customer_select/custselc_cubit/custselec_cubit.dart';
import '../../cubit/customer_select/custselc_cubit/custselec_state.dart';

class RcSelectController extends StatelessWidget {
  const RcSelectController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustselecCubit, CustselecState>(
        bloc: context.read<CustselecCubit>()..load('', []),
        builder: (context, state) {
          if (state is LoadingState) {
            return CustomerSelectView(rcList: state.rcList, isLoading: true,);
          } else if (state is LoadedState) {
            return CustomerSelectView(rcList: state.rcList, isLoading: false,);
          } else if (state is ErrorState) {
            return Text(state.error, style: Typo.labelText1,);
          } else {
            return const Text('No accedio a algun estado', style: Typo.labelText1,);
          }
        });
  }
}